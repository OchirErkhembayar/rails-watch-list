require 'open-uri'
require 'json'

class ListsController < ApplicationController
  before_action :find_list, only: %i[show destroy]
  def index
    if params[:query]
      @lists = List.where("name iLIKE ?", "%#{params[:query]}%")
    else
      @lists = List.all
    end
  end

  def show
    @reviews = Review.where('list_id = ?', @list.id)
    @bookmarks = Bookmark.where('list_id = ?', @list.id)
    if params[:filter]
      @bookmarks = Bookmark.where("title iLIKE ?", "%#{params[:filter]}%").where('list_id = ?', @list.id)
    end
    @bookmark = Bookmark.new
    @review = Review.new
    if params[:movie]
      object = find_movies(params[:movie])
      @search_results = object['results']
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(set_list)
    @list.save
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def find_movies(query)
    url = "http://tmdb.lewagon.com/search/movie?&query=#{query}"
    buffer = URI.open(url).read
    JSON.parse(buffer)
  end

  def find_list
    @list = List.find(params[:id])
  end

  def set_list
    params.require(:list).permit(:name, :photob, :photoc)
  end
end
