Rails.application.routes.draw do
  resources :activists
  resources :comments
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
