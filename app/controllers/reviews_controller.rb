class ReviewsController < ApplicationController
  before_action :find_review, only: %i[destroy]
  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @review = Review.new(set_review)
    @list = List.find(params[:list_id])
    @review.list = @list
    @review.save
    redirect_to list_path(@list)
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
