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

  get 'dashboard(/:tab)' => 'dashboard#index', as: :dashboard
  post 'dashboard/profile' => 'dashboard#update_profile', as: :update_profile

  get 'adverts' => 'adverts#index'
  get 'ambassadors' => 'ambassadors#index'

  get 'press' => 'home#press', as: :press
  get 'about' => 'home#about', as: :about
  get 'legals' => 'home#legals', as: :legals
  get 'privacy' => 'home#privacy', as: :privacy
  root to: 'home#index'
end
