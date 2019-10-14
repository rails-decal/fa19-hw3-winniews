Rails.application.routes.draw do
  root "main#index"
  get "cities/update", to: "cities#update"
  post "cities/update", to: "cities#post_up"
  resources :cities
end
