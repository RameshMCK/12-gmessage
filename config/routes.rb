Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :messages do
   member do
        get '/sent', to: 'messages#sent'
        get '/favorite', to: 'messages#favorite'
        patch '/save_favorite', to: 'messages#save_favorite'
    end
  end
end
