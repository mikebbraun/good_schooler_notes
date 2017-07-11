Rails.application.routes.draw do
  get 'home/index', as: 'home'

  get 'login' => 'home#login'
  get 'logout' => 'home#logout'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'post' => 'home#post'
  # HomeController.new.post(...)


  get 'get' => 'home#get', school: 'wyncode', bonus: '100'
  # get 'coupon' => 'home#get', school: 'wyncode', bonus: '100'
  get '/home/:username' => 'home#get'

  get '/:username' => 'home#get'

  post 'search' => 'users#search'
end
