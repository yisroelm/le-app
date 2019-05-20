Rails.application.routes.draw do
  devise_for :les, :controllers => { omniauth_callbacks: "callbacks" }


  root to: 'application#home'

  resources :appointments
  resources :products, except: [:new]



  resources :clients, except: [:show] do
      resources :products, only: [:index, :new, :delete]
  end
end
