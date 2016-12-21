class Group < ApplicationRecord
  has_many :groupings
  has_many :users, through: :groupings
end
