Rails.application.routes.draw do
  root to: "homes#top"
  
  get "/loginform",to:"sessions#loginform"
  post "/login",to:"sessions#login"
  post "/logout",to:"sessions#logout"

  get "/signup",to: "users#new"
  post "/users/create",to: "users#create"
  get "/users/:id/edit",to: "users#edit"
  patch "/users/:id",to:"users#update"
  get "/users/:id/show",to:"users#show"

  get "/memos/index",to: "memos#index"
  get "/new",to: "memos#new"
  post "/create",to: "memos#create"
  delete "/memos/:id",to: "memos#destroy"
  get "/memos/:id/edit",to: "memos#edit"
  patch "/memos/:id",to: "memos#update"

  get "/categories/:id",to: "categories#show"
end
