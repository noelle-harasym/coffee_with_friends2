require 'rails_helper'

RSpec.describe "coffee_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/coffee_types/#{coffee_type.id}", params: params
  end

  describe 'basic fetch' do
    let!(:coffee_type) { create(:coffee_type) }

    it 'works' do
      expect(CoffeeTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('coffee_types')
      expect(d.id).to eq(coffee_type.id)
    end
  end
end
