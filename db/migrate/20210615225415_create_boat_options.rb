class CreateBoatOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :boat_options do |t|
      t.references :boat, index: true
      t.string :option
      t.timestamps null: false
    end

    add_foreign_key :boat_options, :boats
  end
end
