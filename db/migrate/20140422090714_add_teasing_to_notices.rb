class AddTeasingToNotices < ActiveRecord::Migration
  def change
  	add_column :notices, :teasing, :text
  end
end
