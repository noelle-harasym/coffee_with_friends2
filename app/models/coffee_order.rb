class CoffeeOrder < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    coffe_type.to_s
  end

end
