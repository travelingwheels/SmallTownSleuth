class Review < ApplicationRecord
  belongs_to :user
  belongs_to :town
  has_many :comments

  #accepts_nested_attributes_for :town

  def town_attributes=(town_params)
   town = Town.find_or_create_by(town_params)
   town.valid? ? self.town = town : self.town
  end
end
