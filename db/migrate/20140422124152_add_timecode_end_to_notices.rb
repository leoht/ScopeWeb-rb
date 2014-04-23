class AddTimecodeEndToNotices < ActiveRecord::Migration
  def change
  	add_column :notices, :end_timecode, :string
  end
end
