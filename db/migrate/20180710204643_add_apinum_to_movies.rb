class AddApinumToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :apinum, :integer
  end
end
