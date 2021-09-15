Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'app', to: 'home#app'
  get 'users', to: redirect('/app')
  get 'app/category', to: redirect('/app')
  scope :app do
    resources :tasks do
      member do
        patch :update_status
      end
    end
  end
  scope :app do
    resources :categories, except: [:index]
  end
end
