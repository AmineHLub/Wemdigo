class Category < ApplicationRecord
  has_one_attached :cat_image
  has_and_belongs_to_many :tranzactions
end
