class CreateJoinTableNoticeUser < ActiveRecord::Migration
  def change
    create_join_table :notices, :users do |t|
      t.index [:notice_id, :user_id]
      t.index [:user_id, :notice_id]
    end
  end
end
