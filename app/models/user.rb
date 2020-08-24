class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :reviews
  has_many :towns, through: :reviews

end
