Rails.application.routes.draw do
  resources :daily_activity_counters do
    collection do
      get 'graph/:activist_id', to: 'daily_activity_counters#graph', as: :graph
    end
  end
  resources :activists
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
