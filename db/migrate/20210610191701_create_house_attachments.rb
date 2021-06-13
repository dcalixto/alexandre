class CreateHouseAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :house_attachments do |t|
   t.references :house, index: true
       t.string :image
      t.timestamps null: false
    end
     add_foreign_key :house_attachments, :houses
  end
end
