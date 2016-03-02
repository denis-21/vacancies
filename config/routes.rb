Rails.application.routes.draw do
  devise_for :users

  resources :render_countries, only: [:index]

  scope module: :public_part do
    resources :vacancies,        only: [:index, :show] do
      resources :summaries,      only: [:new, :create]
    end
    resources :companies,        only: [:index, :show]
    resources :search_vacancies, only: [:index]

    namespace :create_company_steps do
      resource :companies, only: [:new, :create]
      resource :users, only: [:new, :create]
      resource :confirms, only: [:new, :create]
    end
  end

  namespace :manage, module: :private_part do
    resource :profiles, only: [:edit, :update]
    resources :summaries_history, only: [:index]

    scope module: :companies_admin do
      resources :vacancies do
        resources :summaries, only: [:index, :update]
      end
      resources :reports, only: [:index]
      resource :reports, only: [] do
        resources :vacancies, only: [:show], controller: :vacancies_reports
      end
      resource :profile_companies, except: [:create, :new, :destroy]
    end

    root to: 'companies_admin/vacancies#index'
  end

  namespace :admin, module: 'private_part/admin' do
    resources :companies, except: [:new, :create] do
      resource :approves, only: [:update, :destroy]
    end
    resources :users,        only: [:index]  do
      resource :user_blocks, only: [:create, :destroy]
    end
    resources :external_clients, except: [:edit, :update]

    resources :reports, only: [:index]
    resource :reports, only: [] do
      resources :companies, only: [:show], controller: :companies_reports
    end

    root to: 'companies#index'
  end


  namespace :api do
    namespace :v1 do
      resources :vacancies, only: [:index, :show]
      resources :companies, only: [:index, :show]
    end
  end

  root to: 'public_part/vacancies#index'
end
