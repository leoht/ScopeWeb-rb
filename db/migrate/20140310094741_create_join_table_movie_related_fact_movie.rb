class CreateJoinTableMovieRelatedFactMovie < ActiveRecord::Migration
  def change
    create_join_table :movies, :movie_related_facts do |t|
      # t.index [:movie_id, :movie_related_fact_id]
      # t.index [:movie_related_fact_id, :movie_id]
    end
  end
end
