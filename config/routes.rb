Rails.application.routes.draw do
  devise_for :users
  get '/products' => redirect('/categories')

  resources :categories, only: [:index, :show]
  resources :products, only: [:show] do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  root 'categories#index'
end
