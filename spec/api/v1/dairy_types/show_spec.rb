require "rails_helper"

RSpec.describe "dairy_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dairy_types/#{dairy_type.id}", params: params
  end

  describe "basic fetch" do
    let!(:dairy_type) { create(:dairy_type) }

    it "works" do
      expect(DairyTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("dairy_types")
      expect(d.id).to eq(dairy_type.id)
    end
  end
end
