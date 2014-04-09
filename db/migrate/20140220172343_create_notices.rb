class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :short_content
      t.text :content
      t.string :timecode
      t.string :type
      t.string :image

      t.timestamps
    end
  end
end
