class AddMovieIdToNotices < ActiveRecord::Migration
  def change
  	add_column :notices, :movie_id, :integer
  end
end
