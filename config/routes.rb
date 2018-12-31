Rails.application.routes.draw do

  ActiveAdmin.routes(self)
resources :reviews do
  #this is a shortcut to get it to set up: create, new, show, index, etc that we used for the controller.
  #we would have it be separate instead of nested under via "do" if it was totally unrelated (eg. posts or jobs)

resources :comments


resource :bookmark

end

resources :users

resources :bookmarks

resource :session

resource :account 

get "about", to: "pages#about"

root "pages#home"



end
