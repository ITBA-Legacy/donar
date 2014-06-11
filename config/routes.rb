Donar::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  # Users Routes

  resources :users do
    member do
      get :edit_password
      patch :update_password
    end
  end

  # End Users Routes

  # Organizations Routes

  resources :organizations do

    collection do
      get :list
    end

    resources :comments, except: [:edit, :update]

    resources :campaigns do
      resources :milestones do
        member do
          get :achieve
          patch :confirm_achieved
        end
      end
      resources :contributions
      resources :comments, except: [:edit, :update]
    end
  end

  # End Organizations Routes

  # Campaigns Routes

  resources :campaigns do
    collection do
      get :search
      post :search
    end
  end

  resources :purchases do
    collection do
      get :success_mercadopago_callback
      get :pending_mercadopago_callback
      get :failure_mercadopago_callback
    end
  end

  # End Campaigns Routes

  # Mails Preview Routes

  mount MailPreview => 'mail_view' if Rails.env.development?

  # End Mails Preview Routes

end
