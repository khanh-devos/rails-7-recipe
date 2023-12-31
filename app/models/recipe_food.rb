class RecipeFood < ApplicationRecord
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :recipe
  belongs_to :food
end
