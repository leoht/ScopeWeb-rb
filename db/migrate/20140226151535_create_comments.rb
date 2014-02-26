class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :timecode
      t.datetime :created_at

      t.timestamps
    end
  end
end
