class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :name
      t.string :url
      t.integer :rating
      t.integer :user_id,:null => false, :options =>
        "CONSTRAINT fk_picture_users REFERENCES users(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
