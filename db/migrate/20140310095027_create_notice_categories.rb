class CreateNoticeCategories < ActiveRecord::Migration
  def change
    create_table :notice_categories do |t|
      t.string :title
      t.string :nicename
      t.integer :parent_id
      t.string :color
      t.string :background_color

      t.timestamps
    end
  end
end
