class Review < ApplicationRecord
  belongs_to :user
  belongs_to :town
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates_presence_of :town_id

  #accepts_nested_attributes_for :town

  def town_attributes=(town_params)
   town = Town.find_or_create_by(town_params)
   town.valid? ? self.town = town : self.town
  end

  def created_at_date_time
    self.created_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end
