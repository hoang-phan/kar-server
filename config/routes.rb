Rails.application.routes.draw do
  resources :patches, only: :index
end
