class ReviewsController < ApplicationController


  #check if logged in
  before_action :check_login, except: [:index, :show]

def index
  # this is our list page for our reviews

#variable is something that always changes. we want it to equal to some random number. The "@" indicates the variable
#we want to pull this variable into our HTML

  @price = params[:price]
  @cuisine = params[:cuisine]
  @location = params[:location]
  #find parameters from URL

#start with all the Reviews
@reviews= Review.all

#filtering by price
if @price.present?
  @reviews= @reviews.where(price: @price)
  #replace all the reviews with reviews where the COLUMN price is the parameter of the URL price
end

#filter by Cuisine
if @cuisine.present?
  @reviews= @reviews.where(cuisine: @cuisine)
end

#filtering by location
if @location.present?
  @reviews= @reviews.near(@location)
end


end





def new
  #new is the FORM for adding a new review, not actaully adding it into database
  #def means it's a function
  #need to have an end whenever we have a def
  @review = Review.new
  #get our Review database, and make a new review
  #take our controller, make a new model, and give it to our HTML to add a form to it
end




def create
  #this will take the info from the form and add it to the model
  @review = Review.new(form_params)


  #and then associate it wiht a user
  @review.user = @current_user

#we want to check if the model can be saved
#if it is, we're going to the home page again
#if it isn't, show the new form

if @review.save
  redirect_to root_path
else
  #show the view for new.html.erb
  render "new"

end



end



def show
  #this leads us to an individual review page
@review = Review.find(params[:id])
end



def destroy
  #find the indivial review
  @review = Review.find(params[:id])


  #then we want to destroy it (if they CAN destroy it or have access)
  if @review.user == @current_user
  @review.destroy
    #redirect to homepage
  redirect_to root_path
end



def edit
  #find the individual review and put it into the form
  @review = Review.find(params[:id])

#if not the review user, even if access via URL will be redirected to homepage
  if @review.user != @current_user
    redirect_to root_path
  end
end



def update
#find the individla review
  @review = Review.find(params[:id])
#update with the new info from the form


if @review.user != @current_user
  redirect_to root_path
else

    if @review.update(form_params)
  #redirect somewhere new
    redirect_to review_path(@review)
  else

    render "edit"

    end
end

end


def form_params
  #we can use this within rails and any part of this ReviewsController
  #like a variable/ const in Javascript or a shortcut
  (params.require(:review).permit(:title, :body, :score, :restaurant, :ambiance, :cuisine, :price, :address))
end

end 
end
