Rails.application.routes.draw do
  root to: "events#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "/logout" => "sessions#destroy", as: :logout
  resources :activities
  resources :events do
    resources :tickets
  end

  resource :user do
    get 'retire'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
