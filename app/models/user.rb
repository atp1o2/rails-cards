class User < ActiveRecord::Base
  has_many :categories
  has_many :cards

  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true
end
