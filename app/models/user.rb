class User < ActiveRecord::Base
  validates :name, :username, :email, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  
  has_secure_password

  has_many :items
end
