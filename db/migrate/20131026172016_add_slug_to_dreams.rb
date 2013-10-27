class AddSlugToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :slug, :string
    add_index :dreams, :slug
  end
end
