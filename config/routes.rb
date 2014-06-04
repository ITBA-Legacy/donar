Donar::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  resources :users do
    member do
      get :edit_password
      patch :update_password
    end
  end

  resources :organizations do

    collection do
      get :list
    end

    resources :campaigns do
      resources :contributions
    end

  end

  resources :campaigns do
    collection do
      get :search
      post :search
    end
  end

end
