class AddRatingCountToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :rating_count, :integer, :default=>0
  end

  def self.down
    remove_column :pictures, :rating_count
  end
end
