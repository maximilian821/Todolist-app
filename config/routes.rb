Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'app', to: 'home#app'
  get 'users', to: redirect('/app')
  resources :categories, path: 'app', except: [:index] do
    resources :tasks, only: [:index]
  end
  scope :app do
    resources :tasks, except: [:index]
  end
end
