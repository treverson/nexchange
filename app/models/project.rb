class Project < ApplicationRecord
  belongs_to :projectable, polymorphic: true

  validates :title, presence: true
  validates :description, presence: true
end
