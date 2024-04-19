# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  def create
    @service = Service.find(params[:service_id])
    @review = @service.reviews.build(review_params.merge(user_id: current_user.id)) # Assuming you have a current_user method
    if @review.save
      redirect_to @service, notice: 'Review added successfully.'
    else
      redirect_to @service, alert: 'Failed to add review.'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to service_path(params[:service_id]), notice: 'Review was successfully removed.'
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
