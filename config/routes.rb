Donar::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  get 'funder' => 'application#funder'

  get 'project' => 'application#project'

  resources :organizations do

    collection do
      get :list
    end

    resources :campaigns do
      resources :contributions
    end
  end
end
