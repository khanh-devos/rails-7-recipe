class Food < ApplicationRecord
  # different users could buy same food with different prices.

  belongs_to :user, foreign_key: :buyer_id

  has_many :recipe_foods, foreign_key: 'food_id', dependent: :destroy
end
