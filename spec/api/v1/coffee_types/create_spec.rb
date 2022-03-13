require 'rails_helper'

RSpec.describe "coffee_types#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/coffee_types", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'coffee_types',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CoffeeTypeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CoffeeType.count }.by(1)
    end
  end
end
