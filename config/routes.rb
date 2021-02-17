Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "index#index"
  
  get '/commercial'    => 'pages#commercial'
  get "/home"         => 'pages#index'
  get '/error'        => 'pages#error'
  get '/quotes'        =>  'pages#quotes'
  get '/residential'  => 'pages#residential'
  # get '/charts'       => 'pages#charts'
  # get '/diagram'      => 'pages#diagram'

  # post '/leads'       => 'leads#create'
  # post "/quotes"      => "quotes#create"
   
  devise_scope :user do 
    get "/login" => "devise/sessions#new" 
  end
end