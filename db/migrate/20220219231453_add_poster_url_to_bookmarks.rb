class AddPosterUrlToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :poster_url, :string
  end
end
