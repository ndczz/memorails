class User < ActiveRecord::Base
  has_many :pictures

  def add_picture(picture)
    pictures << picture
  end
end
