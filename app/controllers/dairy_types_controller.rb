class DairyTypesController < ApplicationController
  before_action :set_dairy_type, only: [:show, :edit, :update, :destroy]

  # GET /dairy_types
  def index
    @dairy_types = DairyType.all
  end

  # GET /dairy_types/1
  def show
    @coffee_order = CoffeeOrder.new
  end

  # GET /dairy_types/new
  def new
    @dairy_type = DairyType.new
  end

  # GET /dairy_types/1/edit
  def edit
  end

  # POST /dairy_types
  def create
    @dairy_type = DairyType.new(dairy_type_params)

    if @dairy_type.save
      redirect_to @dairy_type, notice: 'Dairy type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dairy_types/1
  def update
    if @dairy_type.update(dairy_type_params)
      redirect_to @dairy_type, notice: 'Dairy type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dairy_types/1
  def destroy
    @dairy_type.destroy
    redirect_to dairy_types_url, notice: 'Dairy type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dairy_type
      @dairy_type = DairyType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dairy_type_params
      params.require(:dairy_type).permit(:dairy_type)
    end
end
