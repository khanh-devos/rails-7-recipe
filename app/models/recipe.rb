class Recipe < ApplicationRecord
  # dont accept recipe with the same name, no matter it is capitalized or not.
  validates :name, presence: true, length: { maximum: 250 }, uniqueness: { case_sensitive: false }

  validates :public, presence: true
  validates :description, presence: true, length: { maximum: 1000 }

  validates :cooking_time, numericality: { greater_than_or_equal_to: 0 }
  validates :preparation_time, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, foreign_key: :author_id

  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
end
