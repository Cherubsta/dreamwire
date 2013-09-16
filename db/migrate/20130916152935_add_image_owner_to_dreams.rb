class AddImageOwnerToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :imageowner, :string
  end
end
