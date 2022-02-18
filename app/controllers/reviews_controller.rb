class ReviewsController < ApplicationController
  before_action :find_review, only: %i[destroy]
  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @review = Review.new(set_review)
    @list = List.find(params[:list_id])
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    @reviews = @list.reviews
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def destroy
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def set_review
    params.require(:review).permit(:content, :rating)
  end
end
