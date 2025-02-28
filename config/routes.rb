Rails.application.routes.draw do
  # Define the root route (homepage)
  root "boards#index"

  # Resources for Boards
  resources :boards do
    resources :posts, only: [:create, :destroy]
  end
end
