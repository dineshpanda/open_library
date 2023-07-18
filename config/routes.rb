Rails.application.routes.draw do
  resources :books, only: :index do
    post :checkout
  end
end
