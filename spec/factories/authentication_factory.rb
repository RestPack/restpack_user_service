FactoryGirl.define do
  factory :authentication, :class => RestPack::User::Service::Models::Authentication do
    user
    application_id { user.application_id }
    provider 'twitter'
    sequence(:uid)  {|n| "UID_#{n}" }
    omniauth {
      {
        provider: provider,
        uid: uid,
        info: {
          name: 'Gavin Joyce',
          nickname: 'gavinjoyce',
          email: 'gavinjoyce@gmail.com',
          location: 'Dublin, Ireland',
          description: 'Building cool things with Ruby & Ember.js'
        }
      }.to_json
    }
  end
end
