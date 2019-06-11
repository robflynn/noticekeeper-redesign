Rails.application.routes.draw do
  namespace :api do
    get 'cases', to: 'court_cases#index'
  end

  root to: 'pages#root'
end
