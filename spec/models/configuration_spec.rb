require 'spec_helper'

describe Models::Users::Configuration do
  it { should validate_presence_of(:application_id) }
end
