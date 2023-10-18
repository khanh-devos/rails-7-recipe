lass Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { minimun: 2, maximun: 50 }, allow_blank: false
  validates :measurement_unit, presence: true, allow_blank: false
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def name_with_measurement_unit
    "#{name} (#{measurement_unit})"
  end
end
