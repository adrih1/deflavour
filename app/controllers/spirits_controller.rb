class SpiritsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index

    @markers = @spirits.geocoded.map do |spirit|
      {
        lat: spirit.latitude,
        lng: spirit.longitude
      }
    end
  end

  # GET /van/1
  def show
    @van = Spirit.find(params[:id])
    @order = Order.new
    authorize @spirit
    if @spirit.geocode
      @marker = [lat: @spirit.geocode[0], lng: @spirit.geocode[1]]
    end
  end
  # GET /spirit/new
  def new
    @spirit = Spirit.new
    authorize @spirit
  end

  # GET /spirit/1/edit
  def edit
    @spirit = Spirit.find(params[:id])
    authorize @spirit
  end

  # POST /van
  def create
    @spirit = Spirit.new(van_params)
    @spirit.user = current_user
    @van.save
    if @spirit.save
      sleep 2
      redirect_to spirit_path(@spirit)
    else
      render :new, status: :unprocessable_entity
    end
      authorize @spirit
  end

  def update
    authorize @spirit
    if @spirit.update(spirit_params)
      redirect_to van_path(@spirit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @spirit
    @van.destroy
    redirect_to spirits_path, status: :see_other
  end

  private

  def spirit_params
    params.require(:spirit).permit(:name, :color, :category, :price, :producer, :description, :country, :degree, :bio, photo:[])
  end
end
