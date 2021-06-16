class CreateBoatAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :boat_attachments do |t|
      t.references :boat, index: true
      t.string :image
      t.timestamps null: false
    end
    add_foreign_key :boat_attachments, :boats
  end
end
