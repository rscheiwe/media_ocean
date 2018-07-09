class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.datetime :release_date
      t.string :genres
      t.string :poster_path
      t.text :overview

      t.timestamps
    end
  end
end
