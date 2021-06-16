class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :name, limit: 140, index: true
      t.string :image
      t.text :body
      t.string :slug, index: true
      t.boolean :rent, default: true
      t.boolean :sell, default: false
      t.boolean :land, default: false
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
