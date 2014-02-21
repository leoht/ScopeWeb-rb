class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.text :summary
      t.string :file

      t.timestamps
    end
  end
end
