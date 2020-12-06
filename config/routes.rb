Rails.application.routes.draw do
  root "posts#index"
  resources :posts do
    collection { post :import }
  end
end
