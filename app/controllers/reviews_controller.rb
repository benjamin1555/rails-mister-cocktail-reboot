class ReviewsController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
