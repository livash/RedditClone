RedditClone::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :users, :subs, :links, :comments
end
