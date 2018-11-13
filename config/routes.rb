Rails.application.routes.draw do
  devise_for  :users

  namespace :admin do
    resources :ambassadorships
    resources :cities do
      member do
        get :ambassadors
        get :guests
        get :hosts
        get :preregisters
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

  namespace :dashboard do
    namespace :ambassador do
      get 'activity' => 'activity#index'
      get ':city_slug/users/pending' => 'users#pending', as: :users_pending
      root to: 'application#index'
    end

    get 'messages' => 'messages#index'
    get 'messages/:user_slug' => 'messages#user', as: :conversation
    post 'messages/:user_slug' => 'messages#create', as: :send_message

    get 'profile' => 'profile#index'
    put 'profile' => 'profile#update'

    get 'advices' => 'advices#index'

    get 'open_meals' => 'open_meals#index'

    root to: 'application#index'
  end

  post 'preregisters' => 'preregisters#create'
  get 'users/:user_slug' => 'users#show', as: :user
  get 'adverts' => 'adverts#index'
  get 'adverts/:city_slug' => 'adverts#city', as: :city_adverts
  get 'ambassadors' => 'ambassadors#index'
  get 'press' => 'statics#press'
  get 'about' => 'statics#about'
  get 'legals' => 'statics#legals'
  get 'privacy' => 'statics#privacy'

  root to: 'home#index'
end
