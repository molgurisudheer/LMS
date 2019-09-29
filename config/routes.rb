Rails.application.routes.draw do

  root "leaves#index"
  resources :leaves
  devise_for :users

  get '/leaves/:id/approve', to: 'leaves#approve', as: "reporting_head_approve"
  get '/leaves/:id/reject', to: 'leaves#reject', as: "reporting_head_reject"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
