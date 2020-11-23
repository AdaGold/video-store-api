class Video < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :available_inventory, numericality: { greater_than_or_equal_to: 0}
  validates :total_inventory, numericality: { greater_than_or_equal_to: 0}
  validate :validate_available_inventory

  def validate_available_inventory
    if available_inventory > total_inventory
      errors.add(:available_inventory, "can't be greater than total inventory")
    end
  end
end
