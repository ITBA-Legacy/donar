Donar::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  resources :organizations do

    collection do
      get :list
    end

    resources :campaigns do
      resources :contributions
      resources :milestones
    end

  end

end
