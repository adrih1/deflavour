class RecommendationsController < ApplicationController
  def index
    @recommendations = policy_scope(Recommendation)

    @user = current_user
    @recommendation = @user.recommendations.last(5)
  end
end
