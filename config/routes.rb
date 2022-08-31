Rails.application.routes.draw do
  namespace :v1 do
    get 'products', to: 'products#index'
    post '/products', to: 'products#create'
    get '/products/:product_id', to: 'products#show'
    put '/products/:product_id', to: 'products#update'
    delete '/products/:product_id', to: 'products#destroy'
  end
end
