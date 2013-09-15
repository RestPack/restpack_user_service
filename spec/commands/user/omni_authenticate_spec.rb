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
      omniauth_response: @authentication.omniauth
    } }

    it 'returns the existing user' do
      response.success?.should == true
      response.result.should == RestPack::User::Service::Serializers::UserSerializer.resource(
        @authentication.user
      )
    end
  end
end
