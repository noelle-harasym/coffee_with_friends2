require "rails_helper"

RSpec.describe DairyTypeResource, type: :resource do
  describe "serialization" do
    let!(:dairy_type) { create(:dairy_type) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(dairy_type.id)
      expect(data.jsonapi_type).to eq("dairy_types")
    end
  end

  describe "filtering" do
    let!(:dairy_type1) { create(:dairy_type) }
    let!(:dairy_type2) { create(:dairy_type) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: dairy_type2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([dairy_type2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:dairy_type1) { create(:dairy_type) }
      let!(:dairy_type2) { create(:dairy_type) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      dairy_type1.id,
                                      dairy_type2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      dairy_type2.id,
                                      dairy_type1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
