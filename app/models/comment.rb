class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :content, presence: true
  validates :content, length: { maximum: 280 }
end
