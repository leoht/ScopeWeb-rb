class CreateJoinTableTagMovie < ActiveRecord::Migration
  def change
    create_join_table :tags, :movies do |t|
      t.index [:tag_id, :movie_id]
      t.index [:movie_id, :tag_id]
    end
  end
end
