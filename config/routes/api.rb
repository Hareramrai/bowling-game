namespace :api  do
  namespace :v1 do
    resources :games, only: %i[index create] do 
      resources :pins_downs, only: :create
      resources :scores, only: :index
    end
  end
end
