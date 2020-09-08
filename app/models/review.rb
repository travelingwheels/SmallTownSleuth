class Review < ApplicationRecord
  belongs_to :user
  belongs_to :town
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :user_id, :uniqueness => { :scope => :town_id,
    :message => " may only write one review per town." }

  scope :most_popular, -> { Town.left_joins(:reviews).group(:id).order("count(reviews.town_id) desc").limit(5) }

  # accepts_nested_attributes_for :town

  def town_attributes=(town_params)
    town = Town.find_or_create_by(town_params)
    town.valid? ? self.town = town : self.town
  end

  def created_at_date_time
    self.created_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end
