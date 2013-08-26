class AddImageSourceToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :imagesource, :string
  end
end
