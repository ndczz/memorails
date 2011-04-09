# To change this template, choose Tools | Templates
# and open the template in the editor.

class SearchInfo
  attr_accessor :search_str, :width

  def initialize
  end

  def search_str
    @search_str
  end
  def search_str=(search_str)
    @search_str = search_str
  end

  def width
    @width
  end
  def width=(width)
    @width = width
  end

  def height
    @height
  end
  def height=(height)
    @height = height
  end

end
