require 'spec_helper'

describe Users::Models::Configuration do
  it { should validate_presence_of(:application_id) }
end
