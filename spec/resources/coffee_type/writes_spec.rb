require "rails_helper"

RSpec.describe CoffeeTypeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "coffee_types",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CoffeeTypeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CoffeeType.count }.by(1)
    end
  end

  describe "updating" do
    let!(:coffee_type) { create(:coffee_type) }

    let(:payload) do
      {
        data: {
          id: coffee_type.id.to_s,
          type: "coffee_types",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CoffeeTypeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { coffee_type.reload.updated_at }
      # .and change { coffee_type.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:coffee_type) { create(:coffee_type) }

    let(:instance) do
      CoffeeTypeResource.find(id: coffee_type.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CoffeeType.count }.by(-1)
    end
  end
end
