class Api::V1::CoffeeTypesController < Api::V1::GraphitiController
  def index
    coffee_types = CoffeeTypeResource.all(params)
    respond_with(coffee_types)
  end

  def show
    coffee_type = CoffeeTypeResource.find(params)
    respond_with(coffee_type)
  end

  def create
    coffee_type = CoffeeTypeResource.build(params)

    if coffee_type.save
      render jsonapi: coffee_type, status: :created
    else
      render jsonapi_errors: coffee_type
    end
  end

  def update
    coffee_type = CoffeeTypeResource.find(params)

    if coffee_type.update_attributes
      render jsonapi: coffee_type
    else
      render jsonapi_errors: coffee_type
    end
  end

  def destroy
    coffee_type = CoffeeTypeResource.find(params)

    if coffee_type.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: coffee_type
    end
  end
end
