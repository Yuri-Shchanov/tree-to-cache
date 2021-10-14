Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resource :db_tree_views, constraints: { format: 'json' }, only: :show
  resources :cached_tree_views, constraints: { format: 'json' }, only: [:index, :create]
end
