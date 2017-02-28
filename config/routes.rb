Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  get '/welcome/results', to:'welcome#results'

  resources :topics do
    resources :comments
  end

  resources :clubs do
    resources :memberships # FIX?
  end

  resources :reading_lists

  resources :books

end
