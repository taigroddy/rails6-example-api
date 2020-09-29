require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe "#create", type: :request do

    before do 
      post '/api/users/register',
      headers: {
        'Content-Type': 'application/json'
      },
      params: {
        user: {
          email: 'chauductai1996@gmail.com', 
          password: '123123'
        }
      }
    end
    it 'returns user info with token' do
      expect(JSON.parse(response.body)["data"]["id"]).not_to be_nil
    end
    it 'returns user type is not admin' do
      expect(JSON.parse(response.body)["data"]["is_admin"]).to eq(nil).or eq(0)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
