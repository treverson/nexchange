FactoryGirl.define do
  factory :user_project do
    id
    title "MyString"
    description "MyText"
    creator "an email"
    created_at Date()
    updated_at Date()
    projectable_type "User"
    projectable_id 1
  end

  factory :group_project do
    id
    title "MyString"
    description "MyText"
    creator "an email"
    created_at Date()
    updated_at Date()
    projectable_type "Group"
    projectable_id 2
  end


end
