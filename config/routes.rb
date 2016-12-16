Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }, controllers: {sessions: 'sessions'} 
  namespace :admin do
    root to: 'dashboard#index'
    resources :posts
    resources :users
    resources :comments
  end
  resources :users
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'
  resources :posts
    #get '/home', to: 'application#home', as: 'home'
    get '/post', to: 'home#post', as: 'secret'
    get '/about', to: 'home#about', as: 'about'
    get '/contact', to: 'home#contact', as: 'contact'
  
    # resources :lead_profiles do 
    #   get "upload_excel"
    #   post "parse_excel"
    #   resources :lead_profile_data
    # end
    # resources :alerts
    #resources :users
    resources :home
end

