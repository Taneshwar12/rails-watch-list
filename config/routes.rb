Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'lists#index'
  get '/about', to: 'lists#about'
  resources :lists, only: %i[index new show create] do
    resources :bookmarks, only: %i[new create destroy]
  end
end
