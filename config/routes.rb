Rails.application.routes.draw do
  devise_for :admins
  devise_for :doctors
  root "medical_centers#index"

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
  
  match '*unmatched', to: 'application#not_found_method', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
