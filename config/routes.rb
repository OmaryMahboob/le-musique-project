Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "search", to: "pages#search"
  resources :users do
    resources :bands do
      resources :band_members
    end
  end
  resources :chatrooms, only: [:create, :show, :index] do
    resources :messages, only: :create
  end
end
