class CoffeeOrderResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :coffe_type_id, :integer
  attribute :dairy_type_id, :integer
  attribute :iced, :boolean
  attribute :modifications_other, :string
  attribute :rating, :integer
  attribute :picture, :string
  attribute :date, :date
  attribute :user_id, :integer

  # Direct associations

  belongs_to :coffe_type,
             resource: CoffeeTypeResource

  belongs_to :user

  # Indirect associations

end
