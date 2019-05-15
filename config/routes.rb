Rails.application.routes.draw do
  devise_for :les, :controllers => { omniauth_callbacks: "callbacks" }


  root to: 'application#home'
end
