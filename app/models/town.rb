class Town < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :state, presence: true
 
  def formatted_name
    "#{name}, #{state}"
  end

end
