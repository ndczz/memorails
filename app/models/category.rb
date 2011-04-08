class Category < ActiveRecord::Base
  has_many :pictures

  def self.find_all_categories
    find(:all,:order=> "name")
  end
end
