require 'spec_helper'

describe RestPack::User::Service::Models::Authentication do
  it { should validate_presence_of(:application_id) }
  it { should validate_presence_of(:omniauth) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:user_id) }

  it { should ensure_length_of(:provider).is_at_most(128) }
  it { should ensure_length_of(:uid).is_at_most(1024) }

  it { should belong_to(:user) }
  it { subject.class.table_name.should == 'restpack_authentications' }

  describe '#create_from_omniauth' do
    pending
  end

  describe '#get_from_omniauth' do
    pending
  end
end


