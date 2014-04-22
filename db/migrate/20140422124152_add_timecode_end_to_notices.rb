class AddTimecodeEndToNotices < ActiveRecord::Migration
  def change
  	add_column :notices, :timecode_end, :string
  end
end
