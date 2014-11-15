Rails.application.routes.draw do
  require 'api_constraints'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      post 'users/login', to: 'users#login'
      resources :comments
      resources :items do
        resources :comments
      end
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
