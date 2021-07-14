Rails.application.routes.draw do
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
  end
end
