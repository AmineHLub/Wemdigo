class Category < ApplicationRecord
  has_one_attached :cat_image
  has_many :categories_tranzactions, dependent: :delete_all
  has_many :tranzactions, through: :categories_tranzactions, dependent: :delete_all
  validates :name, presence: true
  validates_numericality_of :total, greated_than: 0.0
end
