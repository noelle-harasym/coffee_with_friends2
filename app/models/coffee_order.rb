class CoffeeOrder < ApplicationRecord
  mount_base64_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :dairy_type

  belongs_to :coffe_type,
             :class_name => "CoffeeType"

  belongs_to :user

  # Indirect associations

  # Validations

  validates :rating, :numericality => { :less_than_or_equal_to => 5 }

  # Scopes

  def to_s
    coffe_type.to_s
  end

end
