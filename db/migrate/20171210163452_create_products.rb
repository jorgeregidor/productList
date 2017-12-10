class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.references :category, foreign_key: true
      t.decimal :price
      t.references :currency, foreign_key: true
      t.references :supplier, foreign_key: true

      t.timestamps
    end
    add_index :products, :name
  end
end
