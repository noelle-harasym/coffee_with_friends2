require "rails_helper"

RSpec.describe "coffee_orders#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/coffee_orders/#{coffee_order.id}"
  end

  describe "basic destroy" do
    let!(:coffee_order) { create(:coffee_order) }

    it "updates the resource" do
      expect(CoffeeOrderResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CoffeeOrder.count }.by(-1)
      expect { coffee_order.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
