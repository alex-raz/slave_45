Rails.application.routes.draw do
  root 'pages#home'
  resources :book_wishes, except: [:show]

  devise_for :users
end
