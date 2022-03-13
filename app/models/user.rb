class User < ApplicationRecord
  # Direct associations

  has_many   :coffee_orders,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
