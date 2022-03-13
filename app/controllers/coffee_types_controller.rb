class CoffeeTypesController < ApplicationController
  before_action :set_coffee_type, only: [:show, :edit, :update, :destroy]

  # GET /coffee_types
  def index
    @coffee_types = CoffeeType.all
  end

  # GET /coffee_types/1
  def show
  end

  # GET /coffee_types/new
  def new
    @coffee_type = CoffeeType.new
  end

  # GET /coffee_types/1/edit
  def edit
  end

  # POST /coffee_types
  def create
    @coffee_type = CoffeeType.new(coffee_type_params)

    if @coffee_type.save
      redirect_to @coffee_type, notice: 'Coffee type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /coffee_types/1
  def update
    if @coffee_type.update(coffee_type_params)
      redirect_to @coffee_type, notice: 'Coffee type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /coffee_types/1
  def destroy
    @coffee_type.destroy
    redirect_to coffee_types_url, notice: 'Coffee type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_type
      @coffee_type = CoffeeType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coffee_type_params
      params.require(:coffee_type).permit(:coffee_type)
    end
end
