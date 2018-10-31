Rails.application.routes.draw do
  resources :ambassadorships
  devise_for  :users,
              path: '',
              path_names: {
                sign_up: 'register',
                sign_in: 'login',
                sign_out: 'logout'
              }

  namespace :admin do
    resources :cities do
      member do
        get :ambassadors
        get :guests
        get :hosts
      end
    end
    resources :users do
      collection do
        get :admins
        get :ambassadors
        get :guests
        get :hosts
      end
    end
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
  get 'press' => 'statics#press'
  get 'about' => 'statics#about'
  get 'legals' => 'statics#legals'
  get 'privacy' => 'statics#privacy'

  root to: 'home#index'
end
