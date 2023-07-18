Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: :index do
        post :checkout
      end
    end
  end
end
