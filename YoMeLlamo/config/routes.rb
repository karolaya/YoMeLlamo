Rails.application.routes.draw do
  devise_for :users
  resources :duels do
	collection do
	    get :addvote
      get :finishDuel
  	end
  end
  root to: 'duels#index'
  resources :songs
  resources :singers
  #get '/duels/addvote1', to: 'duels#addvote1'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
