SocialThingamajig::Application.routes.draw do
  resources :users
  resource :session
  resource :user_password
end
