class CreateCategoriesTranzactions < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_tranzactions do |t|
      t.references :category, null: false, foreign_key: true
      t.references :tranzaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
