require "rails_helper"

RSpec.describe DairyTypeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "dairy_types",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DairyTypeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { DairyType.count }.by(1)
    end
  end

  describe "updating" do
    let!(:dairy_type) { create(:dairy_type) }

    let(:payload) do
      {
        data: {
          id: dairy_type.id.to_s,
          type: "dairy_types",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DairyTypeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { dairy_type.reload.updated_at }
      # .and change { dairy_type.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:dairy_type) { create(:dairy_type) }

    let(:instance) do
      DairyTypeResource.find(id: dairy_type.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { DairyType.count }.by(-1)
    end
  end
end
