require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do

  describe "#create", type: :request do
    let!(:user){ FactoryBot.create(:admin_user) }

    before do 
      post '/api/users/login',
      headers: {
        'Content-Type': 'application/json'
      },
      params: {
        email: "chauductai1996@gmail.com",
        password: "123123"
      }
    end
    it 'returns user info with token' do
      expect(JSON.parse(response.body)["data"]["id"]).to eq(user.id)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

end
