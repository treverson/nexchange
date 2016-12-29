class Group < ApplicationRecord
  has_many :groupings, dependent: :destroy
  has_many :users, through: :groupings
  has_many :projects, as: :projectable, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

end
