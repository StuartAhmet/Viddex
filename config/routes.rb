Rails.application.routes.draw do
  devise_for :users
  # controllers: {
  #   registrations: 'user/registrations',
  #   sessions: 'users/sessions',
  #   omniauth_callbacks: 'users/omniauth_callbacks'
  #   }

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, :path => 'terminal' do
    resources :reports
    resources :tutorials
    resources :settings
    resources :backgrounds
    resources :projects, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :videos
  end
  resources :projects, :path => 'watch', only: [:show]
end
