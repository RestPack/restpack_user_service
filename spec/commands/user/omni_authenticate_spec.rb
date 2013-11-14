require 'spec_helper'

describe Commands::Users::User::OmniAuthenticate do
  is_required :application_id, :omniauth_response
  is_optional :user_id

  User = Models::Users::User
  Authentication = Models::Users::Authentication

  let(:response) { subject.class.run(params) }

  before do
    @authentication = create(:authentication)
  end

  context 'existing user' do
    let(:params) { {
      application_id: @authentication.application_id,
      omniauth_response: @authentication.omniauth,
      user_id: @authentication.user_id
    } }

    context 'existing authentication' do
      it 'returns the existing user' do
        response.success?.should == true
        response.result.should == Serializers::Users::User.resource(@authentication.user)
      end
    end

    context 'new authentication' do
      before do
        @authentication.uid += '_OLD'
        @authentication.save!
      end

      it 'returns the existing user' do
        response.success?.should == true
        response.result.should == Serializers::Users::User.resource(@authentication.user)
        @authentication.user.authentications.length.should == 2
      end
    end
  end

  context 'new user' do
    let(:params) {
      @authentication.omniauth['uid'] += '_new'
      return {
        application_id: @authentication.application_id,
        omniauth_response: @authentication.omniauth
      }
    }

    context 'new authentication' do
      it 'created a new user and authentication' do
        @existing_user_count = User.count
        @existing_auth_count = Authentication.count

        response.success?.should == true

        User.count.should == @existing_user_count + 1
        Authentication.count.should == @existing_auth_count + 1

        new_user = response.result[:users].first
        new_user[:email].should == @authentication.omniauth['info']['email']
      end
    end
  end
end
