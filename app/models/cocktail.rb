class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :picture_URL, presence: true
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
