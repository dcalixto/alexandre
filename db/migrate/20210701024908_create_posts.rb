class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.text :description
      t.string :slug, index: true

 
      t.timestamps null: false
    end
  end
end
