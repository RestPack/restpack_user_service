require 'spec_helper'

describe Users::Commands::Configuration::Get do
  is_required :application_id

  let(:response) { subject.class.run(params) }
  let(:params) { {} }

  context 'when no record exists' do
    let(:params) { {
      application_id: 123
    } }

    it 'return new configurations' do
      response.success?.should == true
      response.result[:configurations].length.should == 1
      response.result[:configurations].first[:id].should_not == ''
      response.result[:configurations].first[:application_id].should == 123
      response.result[:configurations].first[:auth_url].should == nil
    end
  end

  context 'when a record exists' do
    before do
      @configuration = Users::Models::Configuration.create({
        application_id: 123,
        data: { 'auth_url' => 'http://somewhere.org/auth' }
      })
    end

    let(:params) { {
      application_id: @configuration.application_id
    } }

    it 'returns the settings' do
      response.success?.should == true
      configurations = response.result[:configurations]
      configurations.length.should == 1
      configurations.first[:id].should == @configuration.id.to_s
      configurations.first[:auth_url].should == 'http://somewhere.org/auth'
    end
  end
end
