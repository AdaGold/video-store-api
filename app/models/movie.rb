class Movie < ApplicationRecord
  has_many :rentals
  validates :title, presence: true
  validates :inventory, presence: true
  validates :inventory, numericality: {only_integer: true}
  validates :inventory, numericality: {greater_than_or_equal_to: 0}
  validates :available_inventory, presence: true
  validates :available_inventory, numericality: {only_integer: true}
  validates :available_inventory, numericality: {greater_than_or_equal_to: 0}

  def add_inventory
    self.available_inventory += 1
    self.save
  end

  def remove_inventory
    self.available_inventory -= 1
    self.save
  end

  def available?
    if self.available_inventory > 0
      return true
    else
      return false
    end
  end

end
