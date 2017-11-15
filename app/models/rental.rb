class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  def set_checkout
    self.checkout_date = Date.today.to_s
  end

  def set_due
    self.due_date = (Date.today + 7).to_s
  end
end
