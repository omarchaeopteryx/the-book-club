Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

  get 'welcome/index'
  root 'welcome#index'
  get '/welcome/results', to:'welcome#results'
  resources :topics do
    resources :comments
  end

end
