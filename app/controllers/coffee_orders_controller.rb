class CoffeeOrdersController < ApplicationController
  before_action :set_coffee_order, only: %i[show edit update destroy]

  def index
    @q = CoffeeOrder.ransack(params[:q])
    @coffee_orders = @q.result(distinct: true).includes(:user, :coffe_type,
                                                        :dairy_type).page(params[:page]).per(10)
  end

  def show; end

  def new
    @coffee_order = CoffeeOrder.new
  end

  def edit; end

  def create
    @coffee_order = CoffeeOrder.new(coffee_order_params)

    if @coffee_order.save
      message = "CoffeeOrder was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @coffee_order, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @coffee_order.update(coffee_order_params)
      redirect_to @coffee_order,
                  notice: "Coffee order was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @coffee_order.destroy
    message = "CoffeeOrder was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to coffee_orders_url, notice: message
    end
  end

  private

  def set_coffee_order
    @coffee_order = CoffeeOrder.find(params[:id])
  end

  def coffee_order_params
    params.require(:coffee_order).permit(:coffe_type_id, :dairy_type_id,
                                         :iced, :modifications_other, :rating, :picture, :date, :user_id)
  end
end
