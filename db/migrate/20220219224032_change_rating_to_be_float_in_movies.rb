class ChangeRatingToBeFloatInMovies < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :rating, :float
  end
end
