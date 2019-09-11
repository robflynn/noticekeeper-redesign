Rails.application.routes.draw do

  get 'design', to: 'pages#design'

  namespace :api do
    resources :notices, only: [:index, :show] do
      resources :events, only: [:index, :show]
      resources :documents, only: [:index, :show]
    end

    resources :cases, only: [:index, :show], controller: 'court_cases' do
      resources :claims, only: [:index, :show]
      resources :events, only: [:index, :show]

      resources :notices, only: [:index, :show] do
        resources :documents, only: [:index, :show]
      end
    end
  end

  root to: 'pages#root'
end
