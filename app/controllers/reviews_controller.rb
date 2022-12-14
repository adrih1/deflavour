class ReviewsController < ApplicationController

  before_action :skip_authorization
  before_action :set_spirit, only: %i[new create]
  def new
    @review = Review.new
    @spirit = Spirit.find(params[:spirit_id])
  end

  def create
    @review = Review.new(review_params)
    @spirit = Spirit.find(params[:spirit_id])
    @review.spirit = @spirit
    @review.user = current_user
    if @review.save
      current_user.reviews.each do |review|
        Experience.create(spirit: @spirit, user: current_user) if current_user.experiences.select{ |experience| experience.spirit.name.include?(review.spirit.name) }.empty?
      end
      redirect_to maindashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_spirit
    @spirit = Spirit.find(params[:spirit_id])
  end
  def review_params
    params.require(:review).permit(:content, :rating)
  end


end
