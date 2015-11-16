Rails.application.routes.draw do

  get 'sites/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #get '/', to: redirect('sites/index/:id') 
  #get '/', to: redirect('itineraries/index/:id')



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'sites/index/update_cities', to: 'sites#update_cities', as: 'update_cities'
  get '/sites/show/:id', to: 'sites#show', as: 'showsites'
  #get '/sites/show/:id', to: 'sites#show', as: 'showothers'
  #get 'sites/show'

  get '/sites/index/:id', to: 'sites#index', as: 'searchsite'
  get 'itineraries/addsite', to: 'itineraries#addsite', as: 'addsite'
  get 'itinerararies/deletesite', to: 'itineraries#deletesite', as: 'deletesite'

  get '/itineraries/show/:id', to: 'itineraries#show', as: 'itineraryshow'
  get '/itineraries/myindex' ,to: 'itineraries#myindex' ,as: 'myindex'


  devise_for :users
 

 resources :itineraries do
 	 member do
 	  put "like", to: "itineraries#upvote"
 	 end
 	end  



root 'itineraries#index'
end
