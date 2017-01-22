FactoryGirl.define do
  factory :project do
    id 1
    title "A Title"
    description "A description"
    creator "a@e.mail"
    created_at {10.minutes.ago}
    updated_at {5.minutes.ago}
    projectable_type "Group"
    projectable_id 1
  end
  factory :user_project do
    id 2
    title "A Title"
    description "A description"
    creator "a@e.mail"
    created_at {10.minutes.ago}
    updated_at {5.minutes.ago}
    projectable_type "User"
    projectable_id 1
  end
end
