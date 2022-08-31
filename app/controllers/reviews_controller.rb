class ReviewsController < ApplicationController

  before_action :skip_authorization
  before_action :set_order, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @order = Order.find(params[:order_id])
    @review.order = @order
    if @review.save
      Experience.create(spirit: @review.order.spirit, user: @review.order.user)
      sleep 2
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end
  def review_params
    params.require(:review).permit(:content, :rating)
  end


end
