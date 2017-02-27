Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  get '/welcome/results', to:'welcome#results'
  resources :topics do
    resources :comments
  end

  resources :clubs do
    resources :reading_lists, :memberships
  end

end
