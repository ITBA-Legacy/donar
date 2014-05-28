Donar::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  resources :organizations do

    collection do
      get :list
    end

    resources :campaigns do
      resources :milestones do
        member do
          get :achieve
          patch :confirm_achieved
        end
      end
      resources :contributions
    end
  end

end
