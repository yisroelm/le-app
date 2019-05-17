Rails.application.routes.draw do
  devise_for :les, :controllers => { omniauth_callbacks: "callbacks" }


  root to: 'application#home'

  resources :appointments
  resources :products



  resources :clients, except: [:show] do
      resources :products, only: [:index]
  end
end
