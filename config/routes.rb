Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :states
  	resources :events

  	get "states/:id/counter", to: "states#getCounter"

end
