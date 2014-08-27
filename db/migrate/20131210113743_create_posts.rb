class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :slug, null: false
      t.text :text
      t.integer :points, null: false, default: 1
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, [:slug, :url], unique: true
  end
end
