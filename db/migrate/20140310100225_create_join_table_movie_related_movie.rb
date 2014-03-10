class CreateJoinTableMovieRelatedMovie < ActiveRecord::Migration
  def change
    create_join_table :movies, :related_movies do |t|
      t.index [:movie_id, :related_movie_id]
      t.index [:related_movie_id, :movie_id]
    end
  end
end
