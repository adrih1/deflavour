class OrdersController < ApplicationController

  before_action :skip_authorization

  def new
    @order = Order.new
    @spirit = Spirit.find(params[:spirit_id])
  end

  def create
    @order = Order.new(order_params)
    @spirit = Spirit.find(params[:spirit_id])
    @order.user = current_user
    @order.spirit = @spirit
    if @order.save
      Experience.create(spirit: @order.spirit, user: @order.user)
      redirect_to dashboard_path(@spirit)
    else
      render 'spirits/show', status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy
    redirect_to dashboard_path, status: :see_other, notice: "🚨 Order was succesfully deleted 🚨"
  end

  def order_recommendation
    params[:spirits].each do |spirit|
      Order.create(spirit_id: spirit, user: current_user)
    end
    redirect_to root_path, notice: "🚨 Order confirmed  🚨"
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :total_price)
  end
end
