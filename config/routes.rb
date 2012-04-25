DDB::Application.routes.draw do

  resources :abouts

  resources :doctypes

  resources :documents

  resources :users

  resources :companies
  
  resources :sessions
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "companies#new", :as => "sign_up"
  
  get "user_log_out" => "sessions#destroy_user", :as => "user_log_out"
  get "user_log_in" => "sessions#new_user", :as => "user_log_in"
  match '/sessions_create_user' => "sessions#create_user", :as => 'sessions_create_user'
  
  get "index_current_user_docs" => "documents#index_current_user_docs", :as => "index_current_user_docs"
  
  match '/:company_usersname' => 'companies#show'
  
  root :to => "companies#home"
  
end
