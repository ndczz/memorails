class AddShowCountToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :show_count, :integer
  end

  def self.down
    remove_column :pictures, :show_count
  end
end
