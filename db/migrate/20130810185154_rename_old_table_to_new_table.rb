class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
  	rename_table :pins, :dreams
  end 
end
