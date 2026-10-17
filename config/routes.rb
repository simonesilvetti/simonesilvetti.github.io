Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "research", to: "pages#research"

  resources :posts, only: %i[index show], param: :slug
  resources :projects, only: %i[index show], param: :slug
  resources :papers, only: %i[index show], param: :slug

  get "up" => "rails/health#show", as: :rails_health_check
end
