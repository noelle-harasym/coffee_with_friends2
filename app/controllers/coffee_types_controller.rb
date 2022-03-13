class CoffeeTypesController < ApplicationController
  before_action :set_coffee_type, only: %i[show edit update destroy]

  def index
    @q = CoffeeType.ransack(params[:q])
    @coffee_types = @q.result(distinct: true).includes(:coffee_orders).page(params[:page]).per(10)
  end

  def show
    @coffee_order = CoffeeOrder.new
  end

  def new
    @coffee_type = CoffeeType.new
  end

  def edit; end

  def create
    @coffee_type = CoffeeType.new(coffee_type_params)

    if @coffee_type.save
      redirect_to @coffee_type, notice: "Coffee type was successfully created."
    else
      render :new
    end
  end

  def update
    if @coffee_type.update(coffee_type_params)
      redirect_to @coffee_type, notice: "Coffee type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @coffee_type.destroy
    redirect_to coffee_types_url,
                notice: "Coffee type was successfully destroyed."
  end

  private

  def set_coffee_type
    @coffee_type = CoffeeType.find(params[:id])
  end

  def coffee_type_params
    params.require(:coffee_type).permit(:coffee_type)
  end
end
