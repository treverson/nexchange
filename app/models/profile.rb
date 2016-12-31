class Profile < ApplicationRecord
  belongs_to  :user
  has_many    :projects, as: :projectable, dependent: :destroy
end