class ExperiencesController < ApplicationController
  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    # Méthode d'instance codée dans le modèle User
    current_user.create_experiences(params)
    skip_authorization
    redirect_to root_path
  end
end
