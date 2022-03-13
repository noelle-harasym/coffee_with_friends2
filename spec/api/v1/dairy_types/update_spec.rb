require "rails_helper"

RSpec.describe "dairy_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/dairy_types/#{dairy_type.id}", payload
  end

  describe "basic update" do
    let!(:dairy_type) { create(:dairy_type) }

    let(:payload) do
      {
        data: {
          id: dairy_type.id.to_s,
          type: "dairy_types",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(DairyTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { dairy_type.reload.attributes }
    end
  end
end
