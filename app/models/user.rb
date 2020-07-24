class User < ApplicationRecord
  has_many :reviews
  has_many :towns through: :reviews
  has_many :comments
end
