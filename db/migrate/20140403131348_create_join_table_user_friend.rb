class CreateJoinTableUserFriend < ActiveRecord::Migration
  def change
    create_table :friendships, id: false do |t|
      t.integer :user_id
      t.integer :friend_id
    end

    add_index(:friendships, [:user_id, :friend_id], :unique => true)
    add_index(:friendships, [:friend_id, :user_id], :unique => true)
  end
end
