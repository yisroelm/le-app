Rails.application.routes.draw do
  devise_for :les, :controllers => { omniauth_callbacks: "callbacks", registrations: "registrations" }


  root to: 'application#home'

  resources :appointments
  resources :products, except: [:new]



  resources :clients, except: [:show] do
      resources :products, only: [:index, :new, :delete]
  end
  get '/most_recent_appointment', to: 'appointments#most_recent_appointment', as: '/most_recent_appointment'

  get '/not_my_client', to: 'appointments#not_my_client', as: '/not_my_client'

    get '/recent_appointment', to: 'appointments#recent_appointment', as: '/recent_appointment'
end
