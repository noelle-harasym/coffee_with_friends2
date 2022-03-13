class CoffeeType < ApplicationRecord
  # Direct associations

  has_many   :coffee_orders,
             foreign_key: "coffe_type_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    coffee_type
  end
end
