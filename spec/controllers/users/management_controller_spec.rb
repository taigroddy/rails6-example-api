require 'rails_helper'

RSpec.describe Users::ManagementController, type: :controller do
  describe "#list", type: :request do
    let!(:admin) { FactoryBot.create(:admin_user) }
    let!(:list_user){ FactoryBot.create_list(:user, 10) }
    
    before do 
      get '/api/users/list',
      headers: {
        Authorization: "Bearer #{admin.generate_jwt}",
        'Content-Type': 'application/json'
      }
    end
    it 'returns list' do
      expect(JSON.parse(response.body).size()).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "#search", type: :request do
    let!(:admin) { FactoryBot.create(:admin_user) }
    let!(:list_user){ FactoryBot.create_list(:user, 10) }
    let!(:user_search){ FactoryBot.create(:user, email: 'chauductai_search@gmail.com') }
    
    before do 
      get '/api/users/search?email=chauductai_search',
      headers: {
        Authorization: "Bearer #{admin.generate_jwt}",
        'Content-Type': 'application/json'
      }
    end
    it 'returns result' do
      expect(JSON.parse(response.body)[0]["id"]).to eq(user_search.id)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update_user", type: :request do
    let!(:admin) { FactoryBot.create(:admin_user) }
    let!(:user_update){ FactoryBot.create(:user) }

    before do 
      patch "/api/users/#{user_update.id}/update",
      headers: {
        Authorization: "Bearer #{admin.generate_jwt}",
        'Content-Type': 'application/json'
      },
      params: {
        user: {
          name: "Chau Duc Tai"
        }
      }
    end
    it 'return data user is updated' do
      expect(JSON.parse(response.body)["data"]["name"]).not_to eq(nil)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end


  describe "#delete_user", type: :request do
    let!(:admin) { FactoryBot.create(:admin_user) }
    let!(:user_detele){ FactoryBot.create(:user) }

    before do 
      delete "/api/users/#{user_detele.id}",
      headers: {
        Authorization: "Bearer #{admin.generate_jwt}",
        'Content-Type': 'application/json'
      }
    end
    it 'return data user is deleted' do
      expect(JSON.parse(response.body)["success"]).to eq(true)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

end