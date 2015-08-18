Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'schedulers#index'
  
  get "/" => 'schedulers#index'
  get "/schedulers" => 'schedulers#index'
  get "/schedulers/:id"  => 'schedulers#show'
  post "/search" => 'schedulers#search'

  
  get "/organizations/new" => 'organizations#new'
  get "/organizations/:id" => 'organizations#show' , as: :organization
  post "/organizations" => 'organizations#create'
  get "/organizations/:id/edit" => 'organizations#edit'
  patch "/organizations/:id" => 'organizations#update'

  get "/projects/new" => 'projects#new'
  get "projects/:id" => 'projects#show', as: :project
  post "/projects" => 'projects#create'
  get "/projects/:id/edit" => 'projects#edit'
  patch "/projects/:id" => 'projects#update'

  post "/addvolunteer" => 'projects#addvolunteer'
  
  post "/removeuserfromproject" => 'projects#removeuserfromproject'

  get "/about" => 'about#index'

  get "/calendar" => 'projects#calendar'

  namespace :api do
    namespace :v1 do
      get '/projects/:id' => 'projects#show'

      get '/user_projects' => 'user_projects#index'
      post "/user_projects" => 'user_projects#create'
    end
  end

end