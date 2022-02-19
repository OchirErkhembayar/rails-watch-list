class RemoveMovieIdFromBookmarks < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookmarks, :movie_id, :integer
  end
end
