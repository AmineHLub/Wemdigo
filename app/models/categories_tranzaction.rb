class CategoriesTranzaction < ApplicationRecord
  belongs_to :category
  belongs_to :tranzaction
end
