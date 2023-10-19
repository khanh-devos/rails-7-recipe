class User < ApplicationRecord
  # dont accept user with the same name, no matter it is capitalized or not.
  validates :name, uniqueness: { case_sensitive: false }

  # dependent => destroy: when delete use, recipe and food also deleted
  has_many :foods, foreign_key: :buyer_id, dependent: :destroy
  has_many :recipes, foreign_key: :author_id, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
