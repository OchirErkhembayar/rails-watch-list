class AddTitleToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :title, :string
  end
end
