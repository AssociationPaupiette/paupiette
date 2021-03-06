Rails.application.routes.draw do
  devise_for  :users

  namespace 'admin' do
    resources 'ambassadorships'
    resources 'cities' do
      member do
        get 'ambassadors'
        get 'guests'
        get 'hosts'
        get 'preregistrations'
      end
    end
    resources 'users' do
      collection do
        get 'admins'
        get 'ambassadors'
        get 'hosts'
        get 'guests'
        get 'search'
      end
    end
    get 'preregistrations' => 'preregistrations#index'
    post 'preregistrations' => 'preregistrations#import'
    root to: 'dashboard#index'
  end

  namespace 'my' do
    get 'messages' => 'messages#index'
    get 'messages/:user_slug' => 'messages#user', as: :conversation
    post 'messages/:user_slug' => 'messages#create', as: :send_message
    get 'profile' => 'profile#index'
    put 'profile' => 'profile#update'
    get 'reviews' => 'reviews#index'
    post 'reviews/:user_slug' => 'reviews#save', as: :review
    patch 'reviews/:user_slug' => 'reviews#save'
    resources 'meals'
    root to: 'dashboard#index'
  end

  namespace 'my_cities' do
    scope ':city_slug' do
      scope 'users' do
        get 'approval' => 'users#approval', as: :users_approval
        get 'hosts' => 'users#hosts', as: :users_hosts
        post ':user_slug/approve' => 'users#approve', as: :user_approve
        post ':user_slug/unapprove' => 'users#unapprove', as: :user_unapprove
        root to: 'users#index', as: :users
      end
      scope 'reviews' do
        get 'approval' => 'reviews#approval', as: :reviews_approval
        post ':id/approve' => 'reviews#approve', as: :review_approve
        post ':id/unapprove' => 'reviews#unapprove', as: :review_unapprove
        root to: 'reviews#index', as: :reviews
      end
    end
    root to: 'application#index'
  end

  post 'preregistrations' => 'preregistrations#create'
  get 'users/:user_slug' => 'users#show', as: :user
  get 'hosts' => 'hosts#index'
  get 'hosts/:city_slug' => 'hosts#city', as: :city_hosts
  get 'ambassadors' => 'ambassadors#index'
  get 'press' => 'pages#press'
  get 'who' => 'pages#who'
  get 'legal' => 'pages#legal'
  root to: 'pages#index'
end
