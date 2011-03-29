Gonnado::Application.routes.draw do
  get "home/index"

  match 'todos/twits' => 'todos#twits', :via => :get

  resources :todos do
    resources :comments

    member do
      post 'finish', :as => 'finish'
    end
  end
  

  root :to => 'home#index'
end
