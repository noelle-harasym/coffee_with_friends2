class DairyTypesController < ApplicationController
  before_action :set_dairy_type, only: %i[show edit update destroy]

  def index
    @q = DairyType.ransack(params[:q])
    @dairy_types = @q.result(distinct: true).includes(:coffee_orders).page(params[:page]).per(10)
  end

  def show
    @coffee_order = CoffeeOrder.new
  end

  def new
    @dairy_type = DairyType.new
  end

  def edit; end

  def create
    @dairy_type = DairyType.new(dairy_type_params)

    if @dairy_type.save
      redirect_to @dairy_type, notice: "Dairy type was successfully created."
    else
      render :new
    end
  end

  def update
    if @dairy_type.update(dairy_type_params)
      redirect_to @dairy_type, notice: "Dairy type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @dairy_type.destroy
    redirect_to dairy_types_url,
                notice: "Dairy type was successfully destroyed."
  end

  private

  def set_dairy_type
    @dairy_type = DairyType.find(params[:id])
  end

  def dairy_type_params
    params.require(:dairy_type).permit(:dairy_type)
  end
end
