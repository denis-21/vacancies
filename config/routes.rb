Rails.application.routes.draw do

  devise_for :users
  root to: 'vacancies#index'

  resources :vacancies ,only: [:index, :show]
  resources :companies ,only: [:index, :show]
  resources :search_vacancies ,only: [:index]



  namespace :admin do
    root to: 'vacancies#index'

    resources :vacancies
    resources :companies
  end

  namespace :api do
    namespace :v1 do
      resources :vacancies, only: [:index, :show]
      resources :companies, only: [:index, :show]
    end
  end

end
