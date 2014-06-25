class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.integer :combined_params
      t.timestamps
    end
    add_index(:votes, [:user_id, :post_id], unique: true)
    add_index(:votes, [:combined_params], unique: true)
  end
end
