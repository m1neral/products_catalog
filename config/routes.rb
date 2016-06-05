Rails.application.routes.draw do
  get '/products' => redirect('/categories')

  resources :categories, :products

  root 'categories#index'
end
