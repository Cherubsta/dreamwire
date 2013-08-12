class AddEmotionToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :emotion, :string
  end
end