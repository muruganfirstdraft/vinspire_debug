Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "quotes#index"
  # Routes for the Mood resource:
  # CREATE
  get "/moods/new", :controller => "moods", :action => "new"
  post "/create_mood", :controller => "moods", :action => "create"

  # READ
  get "/moods", :controller => "moods", :action => "index"
  get "/moods/:id", :controller => "moods", :action => "show"

  # UPDATE
  get "/moods/:id/edit", :controller => "moods", :action => "edit"
  post "/update_mood/:id", :controller => "moods", :action => "update"

  # DELETE
  get "/delete_mood/:id", :controller => "moods", :action => "destroy"
  #------------------------------

  # Routes for the Quote resource:
  # CREATE
  get "/quotes/new", :controller => "quotes", :action => "new"
  post "/create_quote", :controller => "quotes", :action => "create"

  # READ
  get "/quotes", :controller => "quotes", :action => "index"
  get "/quotes/:id", :controller => "quotes", :action => "show"

  # UPDATE
  get "/quotes/:id/edit", :controller => "quotes", :action => "edit"
  post "/update_quote/:id", :controller => "quotes", :action => "update"

  # DELETE
  get "/delete_quote/:id", :controller => "quotes", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
