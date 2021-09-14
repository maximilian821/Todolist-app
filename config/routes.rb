Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'app', to: 'home#app'
  get 'users', to: redirect('/app')
  get 'app/tasks', to: redirect('/app')
  get 'app/category', to: redirect('/app')
  scope :app do
    resources :tasks, except: [:index]
  end
  scope :app do
    resources :categories, except: [:index] do
      resources :tasks, only: [:index]
    end
  end
end
