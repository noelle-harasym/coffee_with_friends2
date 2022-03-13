require "rails_helper"

RSpec.describe "coffee_orders#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/coffee_orders/#{coffee_order.id}", params: params
  end

  describe "basic fetch" do
    let!(:coffee_order) { create(:coffee_order) }

    it "works" do
      expect(CoffeeOrderResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("coffee_orders")
      expect(d.id).to eq(coffee_order.id)
    end
  end
end
