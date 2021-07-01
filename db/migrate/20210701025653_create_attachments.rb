class CreateAttachments < ActiveRecord::Migration[6.1]

  def change
    create_table :attachments do |t|
      t.references :post, index: true
      t.string :image
      t.timestamps null: false
    end
  end
end
