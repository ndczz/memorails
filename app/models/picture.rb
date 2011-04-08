class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  def self.find_new
    find(:all,:limit => 12,:order=> "rating DESC")
  end

  def self.find_most_popular
    find(:all,:limit => 8,:order=> "rating DESC")
  end

  def self.find_by_category_id(id)
    find(:all, :conditions => ['category_id = ?', id], :order=> "rating DESC")
  end
end
