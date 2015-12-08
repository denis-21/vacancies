Rails.application.routes.draw do

  root to: 'vacancies#index'

  resources :vacancies ,only: [:index, :show]
  resources :companies ,only: [:index, :show]
  resources :search_vacancies ,only: [:index]



  namespace :admin do
    root to: 'vacancies#index'

    resources :vacancies
    resources :companies
  end

end
