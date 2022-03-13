require 'rails_helper'

RSpec.describe "dairy_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dairy_types/#{dairy_type.id}"
  end

  describe 'basic destroy' do
    let!(:dairy_type) { create(:dairy_type) }

    it 'updates the resource' do
      expect(DairyTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { DairyType.count }.by(-1)
      expect { dairy_type.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
