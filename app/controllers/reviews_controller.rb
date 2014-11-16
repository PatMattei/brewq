class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @beer = Beer.find(params[:beer_id])
    @beer.reviews.build
  end

  def create
    @review = Review.new(review_params)
    @review.save
    # current_user.reviews << @review
    # current_user.save
    @beer = Beer.find(params[:beer_id])
    @beer.reviews << @review

    if @beer.save
      redirect_to @beer
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
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
