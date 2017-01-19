FactoryGirl.define do
  factory :project do
    id 1
    title "MyString"
    description "MyText"
    creator "an email"
    created_at {10.minutes.ago}
    updated_at {5.minutes.ago}
    projectable_type "User"
    projectable_id 1
  end
  factory :user_project do
    id 2
    title "MyString"
    description "MyText"
    creator "an email"
    created_at {10.minutes.ago}
    updated_at {5.minutes.ago}
    projectable_type "User"
    projectable_id 1
  end
  factory :group_project do
    id 3
    title "MyString"
    description "MyText"
    creator "an email"
    created_at {10.minutes.ago}
    updated_at {5.minutes.ago}
    projectable_type "Group"
    projectable_id 1
  end
end
