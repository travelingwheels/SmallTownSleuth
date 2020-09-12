class Town < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  before_save :capitalize_name, :titleize_state

  validates :name, :state, presence: true

  scope :order_by_state, -> { order(:state) }
  
  def formatted_name
    "#{name}, #{state}"
  end

  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end

  def titleize_state
    self.state = self.state.split.collect(&:upcase).join(' ') if self.state && !self.state.blank?
  end
end
