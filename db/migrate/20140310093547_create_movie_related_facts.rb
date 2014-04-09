class CreateMovieRelatedFacts < ActiveRecord::Migration
  def change
    create_table :movie_related_facts do |t|
      t.string :title
      t.text :content
      t.string :photo

      t.timestamps
    end
  end
end
