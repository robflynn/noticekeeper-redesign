Rails.application.routes.draw do
  namespace :api do
    resources :cases, only: [:index, :show], controller: 'court_cases'
  end

  root to: 'pages#root'
end
