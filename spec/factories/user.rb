FactoryGirl.define do
  pw = "password"
  factory :user do
    id 1
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
    password_confirmation pw
    name "user"
  end
end
