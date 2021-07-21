Rails.application.routes.draw do
  devise_for :administrators
  root to: 'works#index'
  resources :works do
    collection do
      get 'works'
    end
    collection do
      get 'profile'
    end
    collection do
      get 'contact'
    end
    collection do
      get 'link'
    end
    collection do
      get 'list'
    end
  end
end
