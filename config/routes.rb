Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'home#index'
    resources :locations
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
