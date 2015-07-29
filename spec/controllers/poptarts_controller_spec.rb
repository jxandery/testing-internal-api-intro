require 'rails_helper'

describe PoptartsController do
  context '#index' do
    it 'returns all the poptarts' do
      Poptart.create!(flavor: 'strawberry', sprinkles: 'red')
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      poptarts = JSON.parse(response.body)
      expect(poptarts.count).to eq(1)

      poptart = poptarts.last
      expect(poptart['flavor']).to eq('strawberry')
      expect(poptart['sprinkles']).to eq('red')
    end
  end

  context '#show' do
    it 'returns individual poptart' do
      poptart = Poptart.create!(flavor: 'cinnamon', sprinkles: 'none')
      get :show, id: poptart.id, format: :json

      expect(response).to have_http_status(:ok)
      poptart_response = JSON.parse(response.body)
      expect(poptart_response['flavor']).to eq('cinnamon')
      expect(poptart_response['sprinkles']).to eq('none')
    end
  end
end
