class ChangePictureRatingType < ActiveRecord::Migration
  def self.up
    change_column :pictures, :rating, :decimal,
      :precision => 3,:scale=>2,:default=>0
  end

  def self.down
    change_column :pictures, :rating, :integer
  end
end
