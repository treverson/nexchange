FactoryGirl.define do
  pw = "password"
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
    password_confirmation pw
    confirmed_at Time.now
  end
end
