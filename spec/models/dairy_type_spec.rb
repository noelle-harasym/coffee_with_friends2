require "rails_helper"

RSpec.describe DairyType, type: :model do
  describe "Direct Associations" do
    it { should have_many(:coffee_orders) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
