class Food < ApplicationRecord

  has_one :categories
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :price,  numericality: { greater_than_or_equal_to: 0.01 }, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end
