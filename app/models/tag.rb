class Tag < ActiveRecord::Base
  has_and_belongs_to_many :pictures

  def self.find_by_name(name)
    find(:all, :conditions => ['name = ?', name])
  end
end
