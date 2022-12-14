class SpiritsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @spirits = policy_scope(Spirit)
    @markers = @spirits.geocoded.map do |spirit|
      {
        lat: spirit.latitude,
        lng: spirit.longitude
      }
    end
    if params[:query].present?
      @spirits = Spirit.where("title ILIKE ?", "%#{params[:query]}%")
    elsif params[:category].present?
      @spirits = Spirit.search_btn(params[:category])
    else
      @spirits = Spirit.all
    end


    @chart_data = {
      labels: %w[January February March April May June July],
      datasets: [{
        label: 'My First dataset',
        backgroundColor: 'transparent',
        borderColor: '#3B82F6',
        data: [37, 83, 78, 54, 12, 5, 99]
      }]
    }

    @chart_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  end



  # GET /spirit/1
  def show
    @spirit = Spirit.find(params[:id])
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

  # POST /spirit
  def create
    @spirit = Spirit.new(spirit_params)
    @spirit.user = current_user.admin?
    @spirit.save
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
      redirect_to spirit_path(@spirit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @spirit
    @spirit.destroy
    redirect_to spirits_path, status: :see_other
  end

  private

  def spirit_params
    params.require(:spirit).permit(:name, :color, :category, :price, :producer, :description, :country, :degree, :bio, photo:[])
  end
end
