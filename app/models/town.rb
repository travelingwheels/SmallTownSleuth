class Town < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def formatted_name
    "#{name}, #{state}"
  end

end
