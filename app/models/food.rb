class Food < ApplicationRecord
  # dont accept food with the same name, no matter it is capitalized or not.
  validates :name, uniqueness: { case_sensitive: false }

  belongs_to :user, foreign_key: :buyer_id
  
  has_many :recipe_foods
end