class Project < ApplicationRecord
  belongs_to :projectable, polymorphic: true

  validates :title, presence: true
  validates :description, presence: true
  # validates :creator, presence: true
  validates :projectable_type, presence: true
  validates :projectable_id, presence: true
end
