Rails.application.routes.draw do
  devise_for :users
  
  resources :spaces, except: [:index] do
    resources :calendars
    resources :calendar_entries, only: [:new, :create, :edit, :update]
  end
end
