class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify
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

  def self.sort_by(term, n, p)
    term ||= "id"
    n ||= "10"
    p ||= "1"

    unless n.to_i > 0 && p.to_i > 0
      raise ArgumentError.new("Invalid page or per page input")
    end

    terms =["id", "title", "release_date"]

    start = (p.to_i-1)*n.to_i
    finish = (p.to_i)*n.to_i - 1

    if terms.include?(term)
      self.order(term.to_sym)[start..finish]
    else
      raise ArgumentError.new("Invalid Sort Term")
    end


  end

end
