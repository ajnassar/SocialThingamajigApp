SocialThingamajig::Application.routes.draw do
  resources :users do
    resources :friend_circles, only: [:new, :index]
  end

  resources :friend_circles, except: [:new, :index]

  resource :session
  resource :user_password
end
