class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise    :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable


  has_one   :profile
  has_many  :groupings
  has_many  :groups, through: :groupings
  has_many  :projects, as: :projectable, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true

end
