require 'rails_helper'

RSpec.describe "coffee_orders#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/coffee_orders", params: params
  end

  describe 'basic fetch' do
    let!(:coffee_order1) { create(:coffee_order) }
    let!(:coffee_order2) { create(:coffee_order) }

    it 'works' do
      expect(CoffeeOrderResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['coffee_orders'])
      expect(d.map(&:id)).to match_array([coffee_order1.id, coffee_order2.id])
    end
  end
end
