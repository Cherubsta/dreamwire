class AddFeaturedToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :featured, :boolean, default: false
  end
end
