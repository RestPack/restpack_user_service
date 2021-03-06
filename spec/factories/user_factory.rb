FactoryGirl.define do
  factory :user, :class => Users::Models::User do
    sequence(:application_id)
    sequence(:description)  {|n| "Description ##{n}" }
    sequence(:email)        {|n| "email ##{n}" }
    sequence(:image)        {|n| "image ##{n}" }
    sequence(:location)     {|n| "location ##{n}" }
    sequence(:name)         {|n| "name ##{n}" }
    sequence(:nickname)     {|n| "nickname ##{n}" }
  end
end
