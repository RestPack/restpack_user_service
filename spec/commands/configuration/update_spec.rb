require 'spec_helper'

describe Commands::Users::Configuration::Update do
  let(:response) { subject.class.run(params) }

  before do
    @configuration = Models::Users::Configuration.create({
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

  it 'updates the configuration' do
    response.success?.should == true
    response.result[:configurations].length.should == 1

    @configuration.reload
    @configuration.data['auth_url'].should == 'http://new.io/auth'
    response.result[:configurations].first == Serializers::Users::Configuration.as_json(@configuration)
  end
end
