class CreateJoinTableChapterUser < ActiveRecord::Migration
  def change
    create_join_table :chapters, :users do |t|
      # t.index [:chapter_id, :user_id]
      # t.index [:user_id, :chapter_id]
    end
  end
end
