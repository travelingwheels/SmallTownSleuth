class Review < ApplicationRecord
  belongs_to :user
  belongs_to :town
  has_many :comments

  accepts_nested_attributes_for :town
end
