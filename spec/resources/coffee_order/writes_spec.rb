require "rails_helper"

RSpec.describe CoffeeOrderResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "coffee_orders",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CoffeeOrderResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CoffeeOrder.count }.by(1)
    end
  end

  describe "updating" do
    let!(:coffee_order) { create(:coffee_order) }

    let(:payload) do
      {
        data: {
          id: coffee_order.id.to_s,
          type: "coffee_orders",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CoffeeOrderResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { coffee_order.reload.updated_at }
      # .and change { coffee_order.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:coffee_order) { create(:coffee_order) }

    let(:instance) do
      CoffeeOrderResource.find(id: coffee_order.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CoffeeOrder.count }.by(-1)
    end
  end
end
