class User < ApplicationRecord
  has_many :reviews
  has_many :comments
  has_many :commented_reviews, through: :comments, scource: :review
  has_many :towns, through: :reviews

end
