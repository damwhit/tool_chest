class Tool < ActiveRecord::Base
  validates :name, presence: true
  # this prevents you from submitting a form with a missing name attribute
  def formatted_price
    price / 100.0
  end

end
