class CreateRelatedMovies < ActiveRecord::Migration
  def change
    create_table :related_movies do |t|
      t.string :title
      t.string :image
      t.text :summary
      t.integer :year

      t.timestamps
    end
  end
end
