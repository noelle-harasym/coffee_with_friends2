require 'rails_helper'

RSpec.describe CoffeeTypeResource, type: :resource do
  describe 'serialization' do
    let!(:coffee_type) { create(:coffee_type) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(coffee_type.id)
      expect(data.jsonapi_type).to eq('coffee_types')
    end
  end

  describe 'filtering' do
    let!(:coffee_type1) { create(:coffee_type) }
    let!(:coffee_type2) { create(:coffee_type) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: coffee_type2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([coffee_type2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:coffee_type1) { create(:coffee_type) }
      let!(:coffee_type2) { create(:coffee_type) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            coffee_type1.id,
            coffee_type2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            coffee_type2.id,
            coffee_type1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
