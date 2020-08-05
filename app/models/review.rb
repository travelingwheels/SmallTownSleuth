class Review < ApplicationRecord
  belongs_to :user
  belongs_to :town
  has_many :comments
  
end
