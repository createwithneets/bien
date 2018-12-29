class ReviewsController < ApplicationController

def index
  # this is our list page for our reviews

#variable is something that always changes. we want it to equal to some random number. The "@" indicates the variable
#we want to pull this variable into our HTML

@reviews= Review.all
#in our model, we want to find all of them as people submit them

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
  #this will take the info from the form and add it to the database
  @review = Review.new(form_params)
  #here we require that there is a review, that all three sections are fulfilled
  #the ":" just shows that it's NOT a variable. something that stays the same.

  #want to save this new review to the database
  #to take the variable that is the review:
  @review.save

  #redirect back to home page
  redirect_to root_path
end



def show
  #this leads us to an individual review page
@review = Review.find(params[:id])
end



def destroy
  #find the indivial review
  @review = Review.find(params[:id])
  #then we want to destroy it
  @review.destroy
    #redirect to homepage
  redirect_to root_path
end



def edit
  #find the individual review and put it into the form
  @review = Review.find(params[:id])
end



def update
#find the individla review
  @review = Review.find(params[:id])
#update with the new info from the form

@review.update(form_params)
#redirect somewhere new
redirect_to review_path(@review)

end


def form_params
  #we can use this within rails and any part of this ReviewsController
  #like a variable/ const in Javascript or a shortcut
  (params.require(:review).permit(:title, :body, :score))
end



end
