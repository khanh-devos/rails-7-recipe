class User < ApplicationRecord
  # dont accept user with the same name, no matter it is capitalized or not.
  validates :name, uniqueness: { case_sensitive: false }

  has_many :foods, foreign_key: :buyer_id
  has_many :recipes, foreign_key: :author_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
