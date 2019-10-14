Rails.application.routes.draw do
  resources :daily_activity_counters
  resources :activists
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
