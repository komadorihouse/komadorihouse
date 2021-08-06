Rails.application.routes.draw do
  devise_for :administrators
  root to: 'works#index'
  resources :contacts, only: [:new, :create]
  resources :works do
    collection do
      get 'works' 
    end
    member do
      get 'creater'
    end
    member do
      get 'types'
    end
    member do
      get 'creater_type'
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
    collection do
      get 'show_mail'
    end
  end
end
