require_relative '../../spec_helper'

describe RestPack::User::Service::Commands::User::OmniAuthenticate do
  is_required :application_id, :omniauth_response
  is_optional :user_id

  let(:response) { subject.class.run(params) }
  let(:params) { {} }

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
        response.result.should == RestPack::User::Service::Serializers::UserSerializer.resource(
          @authentication.user
        )
      end
    end

    context 'new authentication' do
      before do
        @authentication.uid += '_OLD'
        @authentication.save!
      end

      it 'returns the existing user' do
        response.success?.should == true
        response.result.should == RestPack::User::Service::Serializers::UserSerializer.resource(
          @authentication.user
        )
        @authentication.user.reload.authentications.length.should == 2
      end
    end
  end
end
