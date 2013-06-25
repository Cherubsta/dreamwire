class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :pins, [:user_id, :created_at]
  end
end
