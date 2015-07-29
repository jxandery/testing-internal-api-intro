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

  context '#create' do
    it 'creates the best poptart' do
      post :create, format: :json, poptart: {flavor: 'smore', sprinkles: 'black and white'}

      expect(response).to have_http_status(:created)
      poptart_response = JSON.parse(response.body)
      expect(poptart_response['flavor']).to eq('smore')
      expect(poptart_response['sprinkles']).to eq('black and white')
    end
  end

  context '#update' do
    it 'edits the  poptart' do
      poptart = Poptart.create!(flavor: 'smore', sprinkles: 'none')
      put :update, id:poptart.id, format: :json, poptart: {flavor: 'more smore', sprinkles: 'grey'}

      expect(response).to have_http_status(:no_content)
      expect(poptart.reload.flavor).to eq('more smore')
      expect(poptart.sprinkles).to eq('grey')
    end
  end
end
