class CreateJoinTableNoticeCategoryNoticeCategory < ActiveRecord::Migration
  def change
    create_join_table :notice_categories, :notice_categories do |t|
      # t.index [:notice_category_id, :notice_category_id]
      # t.index [:notice_category_id, :notice_category_id]
    end
  end
end
