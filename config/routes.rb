Rails.application.routes.draw do
  devise_for  :users

  namespace :admin do
    resources :ambassadorships
    resources :cities do
      member do
        get :ambassadors
        get :guests
        get :hosts
        get :preregistrations
      end
    end
    resources :users do
      collection do
        get :admins
        get :ambassadors
        get :hosts
        get :guests
      end
    end
    root to: 'dashboard#index'
  end

  namespace :my do
    get 'messages' => 'messages#index'
    get 'messages/:user_slug' => 'messages#user', as: :conversation
    post 'messages/:user_slug' => 'messages#create', as: :send_message

    get 'profile' => 'profile#index'
    put 'profile' => 'profile#update'

    get 'advices' => 'advices#index'

    get 'meals' => 'meals#index'

    root to: 'application#index'
  end

  namespace :my_cities do
    get 'activity' => 'activity#index'
    get ':city_slug/users/pending' => 'users#pending', as: :users_pending
    root to: 'application#index'
  end

  post 'preregistrations' => 'preregistrations#create'
  get 'users/:user_slug' => 'users#show', as: :user
  get 'hosts' => 'hosts#index'
  get 'hosts/:city_slug' => 'hosts#city', as: :city_hosts
  get 'ambassadors' => 'ambassadors#index'
  get 'press' => 'statics#press'
  get 'who' => 'statics#who'
  get 'terms' => 'statics#terms'
  get 'privacy' => 'statics#privacy'

  root to: 'home#index'
end
