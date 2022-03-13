require "rails_helper"

RSpec.describe "dairy_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dairy_types", params: params
  end

  describe "basic fetch" do
    let!(:dairy_type1) { create(:dairy_type) }
    let!(:dairy_type2) { create(:dairy_type) }

    it "works" do
      expect(DairyTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["dairy_types"])
      expect(d.map(&:id)).to match_array([dairy_type1.id, dairy_type2.id])
    end
  end
end
