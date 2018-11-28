Rails.application.routes.draw do
  # get 'sales/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sales, only: [:new, :create]
  get 'sales/done'
end