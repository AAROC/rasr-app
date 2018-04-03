Rails.application.routes.draw do

  resources :glibraries
  # ORCID
  # Match is deprecated
  # match '/auth/:provider/callback' => 'authentications#orcid'
  # get '/auth/:provider/callback' => 'authentications#orcid'
  # post '/auth/:provider/callback' => 'authentications#orcid'
  # </ORCID>
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # from https://github.com/datacite/volpino/blob/master/config/routes.rb
  # devise_scope :user do
  #   get 'sign_in', :to => 'users/sessions#new', :as => :new_session
  #   post 'sign_in', :to => 'users/session#create', :as => :session
  #   get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  #
  #   get 'link_orcid', :to => 'users/sessions#link_orcid', :as => :link_orcid_session
  # end

  resources :experiments, :languages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "glibrary/index"
  get "experiments/index"
  # get "/home", :to => redirect('../public/home')
  get 'public/home'
  root "experiments#index"

end
