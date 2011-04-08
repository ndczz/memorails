class HomeController < ApplicationController
  def index
    @most_popular_pics = Picture.find_most_popular
    @new_pics = Picture.find_new
    @categories = Category.find_all_categories
  end

  def show_category
    @category = Category.find(params[:id])

    @pictures = Picture.find_by_category_id(params[:id])
    @categories = Category.find_all_categories
  end

  def show_picture
    @picture = Picture.find(params[:id])
    show_count = @picture.show_count + 1
    @picture.update_attribute("show_count", show_count)
    @categories = Category.find_all_categories
    render :layout => "show_picture_layout"
  end
end
