Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_scope :user do
      post 'users/login', to: 'users/sessions#create'
    end
    get 'users/list', to: 'users/management#list'
    patch 'users/:id/update', to: 'users/management#update_user'
    put 'users/:id/update', to: 'users/management#update_user'
    delete 'users/:id', to: 'users/management#delete_user'
    get 'users/search', to: 'users/management#search'
  end
end