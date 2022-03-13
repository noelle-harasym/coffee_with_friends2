class Api::V1::DairyTypesController < Api::V1::GraphitiController
  def index
    dairy_types = DairyTypeResource.all(params)
    respond_with(dairy_types)
  end

  def show
    dairy_type = DairyTypeResource.find(params)
    respond_with(dairy_type)
  end

  def create
    dairy_type = DairyTypeResource.build(params)

    if dairy_type.save
      render jsonapi: dairy_type, status: :created
    else
      render jsonapi_errors: dairy_type
    end
  end

  def update
    dairy_type = DairyTypeResource.find(params)

    if dairy_type.update_attributes
      render jsonapi: dairy_type
    else
      render jsonapi_errors: dairy_type
    end
  end

  def destroy
    dairy_type = DairyTypeResource.find(params)

    if dairy_type.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: dairy_type
    end
  end
end
