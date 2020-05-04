class Review < ApplicationRecord
  validates :rating, inclusion: { in: (0..5) }
  validates :content, presence: true
  belongs_to :cocktail
end
