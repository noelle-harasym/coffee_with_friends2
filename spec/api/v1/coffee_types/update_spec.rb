require "rails_helper"

RSpec.describe "coffee_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/coffee_types/#{coffee_type.id}", payload
  end

  describe "basic update" do
    let!(:coffee_type) { create(:coffee_type) }

    let(:payload) do
      {
        data: {
          id: coffee_type.id.to_s,
          type: "coffee_types",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CoffeeTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { coffee_type.reload.attributes }
    end
  end
end
