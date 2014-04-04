class AddNoticeCategoryIdToNotices < ActiveRecord::Migration
  def change
  	add_column :notices, :notice_category_id, :integer
  end
end
