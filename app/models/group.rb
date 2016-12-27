class Group < ApplicationRecord
  has_many :groupings, :dependent => :destroy
  has_many :users, through: :groupings

  validates :title, presence: true
  validates :description, presence: true

end
