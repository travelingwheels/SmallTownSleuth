class Town < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  validates :name, :state, presence: true

  scope :order_by_state, -> {order(:state)}

  def formatted_name
    "#{name}, #{state}"
  end

end
