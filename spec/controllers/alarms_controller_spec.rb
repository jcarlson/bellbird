require 'rails_helper'

RSpec.describe AlarmsController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post :create, params: { alarm: { text: 'this is a new alarm' } }
      expect(response).to redirect_to(:index)
    end
  end
end
