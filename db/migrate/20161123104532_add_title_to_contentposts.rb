class AddTitleToContentposts < ActiveRecord::Migration
  def change
    add_column :contentposts, :title, :string
  end
end
