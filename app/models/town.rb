class Town < ApplicationRecord
  has_many :reviews
  has_many :users through: :reviews
  has_many :comments through: :reviews
end
