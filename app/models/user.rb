class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :reviews
  has_many :towns, through: :reviews

  validates :name, :email, presence: true
  validates_uniqueness_of :email

  scope :top_reviewers, -> {left_joins(:reviews).group("reviews.user_id").order("count(reviews.user_id) desc").limit(2)}

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end
