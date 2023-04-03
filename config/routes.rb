Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users do
    resources :chatrooms do
      resources :messages
    end
    resources :bands do
      resources :band_members
    end
  end
  # resources :bands do
  #   resources :band_members
  #   resources :band_posts
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
