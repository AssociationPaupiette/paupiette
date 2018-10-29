Rails.application.routes.draw do
  devise_for  :users,
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout'
              }

  namespace :admin do
    root to: 'dashboard#index'
  end

  get '/dashboard' => 'dashboard#index'

  get '/adverts' => 'adverts#index'
  get '/ambassadors' => 'ambassadors#index'

  get '/press' => 'home#press'
  get '/about' => 'home#about'
  get '/legals' => 'home#legals'
  get '/privacy' => 'home#privacy'
  root to: 'home#index'
end
