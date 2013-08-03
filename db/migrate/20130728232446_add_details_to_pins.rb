class AddDetailsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :privacy, :boolean, default: true
    add_column :pins, :title, :string
    add_column :pins, :date, :datetime
    add_column :pins, :nightmare, :boolean
    add_column :pins, :lucid, :boolean
    add_column :pins, :recurring, :boolean
    add_column :pins, :fragmented, :boolean
    add_column :pins, :hashtag, :text
  end
end