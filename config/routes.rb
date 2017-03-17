Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  #This will add all routes for articles
  resources :articles

  #This will add /signup and redirect to users#new path
  get 'signup', to: 'users#new'

  #This will add all routes for users except users#new
  resources :users, except: [:new]

end
