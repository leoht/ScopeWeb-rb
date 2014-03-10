class CreateNoticeCategories < ActiveRecord::Migration
  def change
    create_table :notice_categories do |t|
      t.string :title
      t.string :nicename

      t.timestamps
    end
  end
end
