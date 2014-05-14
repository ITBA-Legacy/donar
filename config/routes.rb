Donar::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  resources :users

  resources :organizations do

    collection do
      get :list
    end

    resources :campaigns do
      resources :contributions
    end

  end
end
