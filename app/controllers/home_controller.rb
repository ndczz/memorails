class HomeController < ApplicationController
  def index
    @most_popular_pics = Picture.find_most_popular
    @new_pics = Picture.find_new
    @categories = Category.find_all_categories
  end

  def show_category
    @category = Category.find(params[:id])
    @pictures = @category.pictures
    @categories = Category.find_all_categories
  end

  def show_picture
    @picture = Picture.find(params[:id])
    @tags = @picture.tags
    show_count = @picture.show_count + 1
    @picture.update_attribute("show_count", show_count)
    @categories = Category.find_all_categories
    render :layout => "show_picture_layout"
  end

  def add_rating
    @picture = Picture.find(params[:id])
    r = params[:r].to_i()
    count = @picture.rating_count + 1
    new_rating_d = (@picture.rating * @picture.rating_count + r) / count

    new_rating_d = (new_rating_d * 100).to_i.to_f / 100

    @picture.update_attribute("rating", new_rating_d)
    @picture.update_attribute("rating_count", count)

    redirect_to :action=> 'show_picture', :id => @picture
  end

  def search
    #@name = params[:name]
    @search_info = SearchInfo.new
    @search_info.search_str=("Porsche 911")
    @search_info.width=(100)
    @search_info.height=(100)

    @strs = @search_info.search_str.split(",")

    @tags = Tag.find_by_name("Смешные картинки")
    @pictures = Picture.find_by_tags(@tags)

    @categories = Category.find_all_categories
  end

  def advanced_search
    @categories = Category.find_all_categories
    name = params[:name]
    if name
      redirect_to(:action=> "search", :name => name)
    end
  end
end
