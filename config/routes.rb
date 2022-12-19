Rails.application.routes.draw do
  devise_for :admins
  devise_for :doctors
  # root "medical_centers#index"
  root "react#index"

  resources :medical_centers do
    resources :departments do
      resources :doctors do
        resources :visits do
          resources :inspection_reports
        end
      end
    end
    resources :patients
  end
  
  post '/search', to: 'search#search'

  match '*unmatched', to: 'application#not_found_method', via: :all
end
