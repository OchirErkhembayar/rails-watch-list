class ListsController < ApplicationController
  before_action :find_list, only: %i[show]
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
    @bookmark = Bookmark.new
    @review = Review.new
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

  private

  def find_list
    @list = List.find(params[:id])
  end

  def set_list
    params.require(:list).permit(:name, :photo)
  end
end
