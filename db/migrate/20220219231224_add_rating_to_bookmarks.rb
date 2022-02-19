class AddRatingToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :rating, :float
  end
end
