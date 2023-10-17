class Recipe < ApplicationRecord
  # dont accept recipe with the same name, no matter it is capitalized or not.
  validates :name, uniqueness: { case_sensitive: false }

  belongs_to :user, foreign_key: :author_id

  has_many :recipe_foods

end
