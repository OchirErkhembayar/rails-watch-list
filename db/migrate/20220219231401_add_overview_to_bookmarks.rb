class AddOverviewToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :overview, :string
  end
end
