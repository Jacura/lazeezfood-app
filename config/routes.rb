Rails.application.routes.draw do
  root to: "home#index" 
   
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :line_items
  resources :carts
  get 'gallery/index'
  get 'gallery/checkout'
  post 'gallery/checkout'
  get 'gallery/purchase_complete'
  get 'gallery/search'

 


  get 'admin/login'
  post 'admin/login'
  get  'admin/logout'
  
  resources :stores
  
  get 'home/index'
  get 'home/services'
  get 'home/about'
  get 'home/contact'
  get 'home/pricing'
  get 'home/portfolio'

  





 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
