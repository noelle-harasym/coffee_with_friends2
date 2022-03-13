require "rails_helper"

RSpec.describe "coffee_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/coffee_types/#{coffee_type.id}"
  end

  describe "basic destroy" do
    let!(:coffee_type) { create(:coffee_type) }

    it "updates the resource" do
      expect(CoffeeTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CoffeeType.count }.by(-1)
      expect { coffee_type.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
