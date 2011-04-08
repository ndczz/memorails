class AddCategoryIdToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :category_id, :integer
  end

  def self.down
    remove_column :pictures, :category_id
  end
end
