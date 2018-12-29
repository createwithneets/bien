Rails.application.routes.draw do

resources :reviews do
  #this is a shortcut to get it to set up: create, new, show, index, etc that we used for the controller.
  #we would have it be separate instead of nested under via "do" if it was totally unrelated (eg. posts or jobs)

resources :comments

end

root "reviews#index"



end
