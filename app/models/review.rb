class Review < ApplicationRecord
  belongs_to :user
  belongs_to :town
  has_many :comments
  has_many :users, through: :comments
end
