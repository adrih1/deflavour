class RecommendationsController < ApplicationController
  def index
    @recommendations = policy_scope(Recommendation)
  end
end
