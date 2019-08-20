Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'home#index'
    resources :departments
    resources :jobs
    resources :locations
  end
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :jobs, only: [:index] do
        collection do
          get '/group-by-locations-and-departments', to: 'jobs#group_by_locations_and_departments'
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
