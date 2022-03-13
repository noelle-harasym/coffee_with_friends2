require "rails_helper"

RSpec.describe CoffeeOrderResource, type: :resource do
  describe "serialization" do
    let!(:coffee_order) { create(:coffee_order) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(coffee_order.id)
      expect(data.jsonapi_type).to eq("coffee_orders")
    end
  end

  describe "filtering" do
    let!(:coffee_order1) { create(:coffee_order) }
    let!(:coffee_order2) { create(:coffee_order) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: coffee_order2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([coffee_order2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:coffee_order1) { create(:coffee_order) }
      let!(:coffee_order2) { create(:coffee_order) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      coffee_order1.id,
                                      coffee_order2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      coffee_order2.id,
                                      coffee_order1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
