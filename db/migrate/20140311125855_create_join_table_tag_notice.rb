class CreateJoinTableTagNotice < ActiveRecord::Migration
  def change
    create_join_table :tags, :notices do |t|
      t.index [:tag_id, :notice_id]
      t.index [:notice_id, :tag_id]
    end
  end
end
