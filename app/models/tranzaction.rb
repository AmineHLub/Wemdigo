class Tranzaction < ApplicationRecord
  has_many :categories_tranzactions, dependent: :delete_all
  has_many :categories, through: :categories_tranzactions
  belongs_to :user
end
