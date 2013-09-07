Ticketee::Application.routes.draw do
  root "projects#index"

  resources :projects do
    resources :tickets
  end

  resources :users

  namespace :admin do
    root "base#index"
    resources :users do
      resources :permissions
      put "permissions", to: "permissions#set",
                         as: "set_permissions"
    end
  end

  resources :files

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"

  delete "/signout", to: "sessions#destroy", as: "signout"
end
