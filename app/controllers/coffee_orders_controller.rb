class CoffeeOrdersController < ApplicationController
  before_action :set_coffee_order, only: [:show, :edit, :update, :destroy]

  # GET /coffee_orders
  def index
    @q = CoffeeOrder.ransack(params[:q])
    @coffee_orders = @q.result(:distinct => true).includes(:user, :coffe_type, :dairy_type).page(params[:page]).per(10)
  end

  # GET /coffee_orders/1
  def show
  end

  # GET /coffee_orders/new
  def new
    @coffee_order = CoffeeOrder.new
  end

  # GET /coffee_orders/1/edit
  def edit
  end

  # POST /coffee_orders
  def create
    @coffee_order = CoffeeOrder.new(coffee_order_params)

    if @coffee_order.save
      message = 'CoffeeOrder was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @coffee_order, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /coffee_orders/1
  def update
    if @coffee_order.update(coffee_order_params)
      redirect_to @coffee_order, notice: 'Coffee order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /coffee_orders/1
  def destroy
    @coffee_order.destroy
    message = "CoffeeOrder was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to coffee_orders_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_order
      @coffee_order = CoffeeOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coffee_order_params
      params.require(:coffee_order).permit(:coffe_type_id, :dairy_type_id, :iced, :modifications_other, :rating, :picture, :date, :user_id)
    end
end
