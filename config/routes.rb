Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' },:controllers => { :registrations => "registrations" } 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'application#home'

    get '/home', to: 'application#home', as: 'home'
    get '/secret', to: 'application#secret', as: 'secret'
    get '/about', to: 'application#about', as: 'about'
    get '/contact', to: 'application#contact', as: 'contact'
  
    resources :lead_profiles do 
      get "upload_excel"
      post "parse_excel"
      resources :lead_profile_data
    end
    resources :alerts
    resources :users
end
end
