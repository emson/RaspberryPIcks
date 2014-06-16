class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :text
      t.integer :points, null: false, default: 1
      t.integer :user_id

      t.timestamps
    end
  end
end
