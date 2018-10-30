Rails.application.routes.draw do
  resources :ambassadorships
  devise_for  :users,
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout'
              }

  namespace :admin do
    resources :cities, :users
    root to: 'dashboard#index'
  end

  namespace :dashboard do
    get 'activity' => 'activity#index'
    get 'messages' => 'messages#index'
    get 'profile' => 'profile#index'
    get 'advices' => 'advices#index'
    get 'open_meals' => 'open_meals#index'

    put 'profile' => 'profile#update'

    root to: 'profile#index'
  end

  get 'adverts' => 'adverts#index'
  get 'ambassadors' => 'ambassadors#index'

  get 'press' => 'home#press', as: :press
  get 'about' => 'home#about', as: :about
  get 'legals' => 'home#legals', as: :legals
  get 'privacy' => 'home#privacy', as: :privacy
  
  root to: 'home#index'
end
