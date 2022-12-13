Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
