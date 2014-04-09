class AddMovieIdToChapters < ActiveRecord::Migration
  def change
  	add_column :movie_chapters, :movie_id, :integer
  end
end
