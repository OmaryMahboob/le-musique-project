Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users do
    # resources :chatrooms, only: [:show, :index] do
    #   resources :messages, only: :create
    # end
    resources :bands do
      resources :band_members
    end
  end

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end
end
