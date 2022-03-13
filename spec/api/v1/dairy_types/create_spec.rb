require 'rails_helper'

RSpec.describe "dairy_types#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/dairy_types", payload
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
          type: 'dairy_types',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(DairyTypeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { DairyType.count }.by(1)
    end
  end
end
