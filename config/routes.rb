Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :messages do
   member do
        get '/sent', to: 'messages#sent'
        get '/favorite', to: 'messages#favorite'
    end
  end
end
