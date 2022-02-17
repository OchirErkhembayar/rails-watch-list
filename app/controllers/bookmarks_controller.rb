class BookmarksController < ApplicationController
  before_action :find_bookmark, only: %i[destroy]
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(set_bookmark)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
