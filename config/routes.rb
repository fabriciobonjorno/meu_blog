Rails.application.routes.draw do
  root 'home#index'
  
  resources :articles
  resources :tags, except: %i[index show]
end
