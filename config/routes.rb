Rails.application.routes.draw do
  get 'about/index', to: 'about#index'
  get 'home/index'
  get 'sectors/index'
  get 'sectors/show'
  get 'industries/index'
  get 'industries/show'
  get 'companies/index'
  get 'companies/show'
  #get '/about', to: 'static_pages#about'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  resources :companies, only: [:index, :show] do
    collection do
      get 'search' #companies/search/:id
    end
  end
  resources :industries, only: [:index, :show]
  resources :sectors, only: [:index, :show]
end
