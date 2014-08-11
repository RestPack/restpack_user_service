require 'spec_helper'

describe Users::Commands::Configuration::Update do
  let(:response) { subject.class.run(params) }

  before do
    @configuration = Users::Models::Configuration.create({
      application_id: 123,
      data: { 'auth_url' => 'http://somewhere.org/auth' }
    })
  end

  let(:params) { {
    configurations: [{
      id: @configuration.id,
      auth_url: 'http://new.io/auth'
    }]
  } }

  context 'with a valid request' do
    it_succeeds 'and updates the configuration' do
      expect(response.result[:configurations].length).to eq(1)
      @configuration.reload
      expect(@configuration.data['auth_url']).to eq('http://new.io/auth')
      expect(response.result[:configurations].first).to eq(Users::Serializers::Configuration.as_json(@configuration))
    end
  end
end
