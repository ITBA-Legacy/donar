Donar::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  resources :campaigns

  resources :organizations do
    collection do
      get :list
    end
  end

end
