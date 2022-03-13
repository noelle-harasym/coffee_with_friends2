require 'rails_helper'

RSpec.describe CoffeeOrder, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_numericality_of(:rating).is_less_than(5) }

    end
end
