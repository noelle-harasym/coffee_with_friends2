require 'rails_helper'

RSpec.describe "coffee_orders#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/coffee_orders/#{coffee_order.id}", payload
  end

  describe 'basic update' do
    let!(:coffee_order) { create(:coffee_order) }

    let(:payload) do
      {
        data: {
          id: coffee_order.id.to_s,
          type: 'coffee_orders',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CoffeeOrderResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { coffee_order.reload.attributes }
    end
  end
end
