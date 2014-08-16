require 'spec_helper'

describe Users::Models::Authentication do
  it { should validate_presence_of(:application_id) }
  it { should validate_presence_of(:omniauth) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:user_id) }

  it { should ensure_length_of(:provider).is_at_most(128) }
  it { should ensure_length_of(:uid).is_at_most(1024) }

  it { should belong_to(:user) }

  let(:application_id) { 123 }
  let(:omniauth) { {
    'provider' => 'twitter',
    'uid' => 'gavinjoyce',
    'email' => 'gavinjoyce@gmail.com'
  } }

  describe '#from_omniauth' do
    it "constructs a new Authentication" do
      authentication = subject.class.from_omniauth(application_id, omniauth)
      authentication.id.should == nil
      authentication.application_id.should == application_id
      authentication.provider.should == 'twitter'
      authentication.uid.should == 'gavinjoyce'
      authentication.omniauth.should == omniauth
    end
  end

  describe '#get_from_omniauth' do
    context "a valid omniauth" do
      before do
        @user_id = 999
        @auth = subject.class.from_omniauth(application_id, omniauth)
        @auth.user_id = @user_id
        @auth.save!
      end

      it "returns the correct authentication" do
        auth = subject.class.get_by_omniauth(application_id, @auth.omniauth)
        auth.id.should == @auth.id
        auth.user_id.should == @user_id
      end
    end
  end
end
