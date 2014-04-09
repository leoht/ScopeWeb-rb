class CreateMovieChapters < ActiveRecord::Migration
  def change
    create_table :movie_chapters do |t|
      t.integer :number
      t.string :title
      t.text :summary
      t.string :timecode

      t.timestamps
    end
  end
end
