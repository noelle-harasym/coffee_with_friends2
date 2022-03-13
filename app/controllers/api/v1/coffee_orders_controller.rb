class Api::V1::CoffeeOrdersController < Api::V1::GraphitiController
  def index
    coffee_orders = CoffeeOrderResource.all(params)
    respond_with(coffee_orders)
  end

  def show
    coffee_order = CoffeeOrderResource.find(params)
    respond_with(coffee_order)
  end

  def create
    coffee_order = CoffeeOrderResource.build(params)

    if coffee_order.save
      render jsonapi: coffee_order, status: 201
    else
      render jsonapi_errors: coffee_order
    end
  end

  def update
    coffee_order = CoffeeOrderResource.find(params)

    if coffee_order.update_attributes
      render jsonapi: coffee_order
    else
      render jsonapi_errors: coffee_order
    end
  end

  def destroy
    coffee_order = CoffeeOrderResource.find(params)

    if coffee_order.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: coffee_order
    end
  end
end
