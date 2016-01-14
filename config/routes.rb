Rails.application.routes.draw do
  devise_for :users
  root to: 'vacancies#index'

  resources :vacancies,        only: [:index, :show] do
    resources :summaries,      only: [:new, :create]
  end
  resources :companies,        only: [:index, :show]
  resources :search_vacancies, only: [:index]

  namespace :admin do
    root to: 'vacancies#index'

    resources :vacancies do
      resources :summaries, only: [:index, :update]
    end
    resources :companies
    resources :users,        only: [:index]  do
      resource :user_blocks, only: [:create, :destroy]
    end
    resource :profiles, only: [:edit, :update]
    resources :external_clients, except: [:edit, :update]

    resources :reports, only: [:index]
    resource :reports, only: [] do
      resources :companies, only: [:show], controller: :companies_reports
    end
  end

  namespace :api do
    namespace :v1 do
      resources :vacancies, only: [:index, :show]
      resources :companies, only: [:index, :show]
    end
  end
end
