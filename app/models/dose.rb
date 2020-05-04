class Dose < ApplicationRecord
  validates :description, :cocktail_id, :ingredient_id, presence: true
  validates_uniqueness_of :cocktail, scope: [:ingredient]
  belongs_to :cocktail
  belongs_to :ingredient
end
