Rails.application.routes.draw do
  devise_for :les, :controllers => { registrations: 'registrations' }

  root to: 'application#home'
end
