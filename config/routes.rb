Rails.application.routes.draw do
  devise_for :users
  
  resources :spaces, except: [:index] do
    resources :calendars
  end
end
