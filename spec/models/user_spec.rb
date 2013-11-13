require 'spec_helper'

describe Models::Users::User do
  it { should validate_presence_of(:application_id) }
  it { should ensure_length_of(:name).is_at_most(128) }
  it { should ensure_length_of(:nickname).is_at_most(128) }
  it { should ensure_length_of(:email).is_at_most(512) }
  it { should ensure_length_of(:image).is_at_most(1024) }
  it { should ensure_length_of(:location).is_at_most(512) }
  it { should ensure_length_of(:description).is_at_most(1024) }

  describe "#authenticate" do
    pending
  end
end
