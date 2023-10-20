class Food < ApplicationRecord
  # different users could buy same food with different prices.
  validates :name, presence: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, foreign_key: :buyer_id

  has_many :recipe_foods, foreign_key: 'food_id', dependent: :destroy
end
