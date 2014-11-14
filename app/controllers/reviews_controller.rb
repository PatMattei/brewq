class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(beer_params)

    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(beer_params)
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path, notice: 'Review deleted'
  end

private

  def review_params
    params.require(:review).permit(:user_id, :beer_id, :body, :score)
  end
end
