require "rails_helper"

RSpec.describe "coffee_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/coffee_types", params: params
  end

  describe "basic fetch" do
    let!(:coffee_type1) { create(:coffee_type) }
    let!(:coffee_type2) { create(:coffee_type) }

    it "works" do
      expect(CoffeeTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["coffee_types"])
      expect(d.map(&:id)).to match_array([coffee_type1.id, coffee_type2.id])
    end
  end
end
