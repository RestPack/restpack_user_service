require_relative '../../spec_helper'

describe RestPack::User::Service::Commands::User::OmniAuthenticate do
  is_required :application_id, :omniauth_response
  is_optional :user_id

  UserSerializer = RestPack::User::Service::Serializers::UserSerializer
  User = RestPack::User::Service::Models::User
  Authentication = RestPack::User::Service::Models::Authentication

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
        response.result.should == UserSerializer.resource(@authentication.user)
      end
    end

    context 'new authentication' do
      before do
        @authentication.uid += '_OLD'
        @authentication.save!
      end

      it 'returns the existing user' do
        response.success?.should == true
        response.result.should == UserSerializer.resource(@authentication.user)
        @authentication.user.authentications.length.should == 2
      end
    end
  end

  context 'new user' do
    let(:params) {
      @authentication.omniauth['uid'] += '_new'
      {
        application_id: @authentication.application_id,
        omniauth_response: @authentication.omniauth
    } }

    context 'new authentication' do
      it 'created a new user and authentication' do
        @existing_user_count = User.count
        @existing_auth_count = Authentication.count
        response.success?.should == true
        User.count.should == @existing_user_count + 1
        Authentication.count.should == @existing_auth_count + 1
      end
    end
  end
end
