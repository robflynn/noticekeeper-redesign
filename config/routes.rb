Rails.application.routes.draw do

  get 'design', to: 'pages#design'

  namespace :api do
    resources :cases, only: [:index, :show], controller: 'court_cases' do
      resources :notices, only: [:index, :show] do
        resources :documents, only: [:index, :show]
      end
    end
  end

  root to: 'pages#root'
end
