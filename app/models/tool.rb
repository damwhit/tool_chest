class Tool < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  belongs_to :category  
  # this prevents you from submitting a form with a missing name attribute
  def formatted_price
    price / 100.0
  end
end
