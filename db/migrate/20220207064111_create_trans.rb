class CreateTrans < ActiveRecord::Migration[7.0]
  def change
    create_table :trans do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
