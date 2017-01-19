FactoryGirl.define do
  factory :group do
    title "MyTitleString"
    description "My Description that is a text field rather than a string, which is still technically a string"
    id 1
  end
end
