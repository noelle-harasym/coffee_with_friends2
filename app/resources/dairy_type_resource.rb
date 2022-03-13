class DairyTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dairy_type, :string

  # Direct associations

  has_many   :coffee_orders

  # Indirect associations

end
