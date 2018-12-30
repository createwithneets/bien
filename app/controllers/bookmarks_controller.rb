class BookmarksController < ApplicationController

before_action :check_login


def index
@bookmarks= @current_user.bookmarks.all

end

def create

  #find the review we're bookmarking
  @review = Review.find(params[:review_id])
#note- it must be specified it's review_id because pulling from another controller, if it's just id, it would mean this bookmark id

  @bookmark = @review.bookmarks.new
  @bookmark.user = @current_user
  @bookmark.save

  #redirect to review page

  redirect_to review_path(@review)
end



def destroy
  @review= Review.find(params[:review_id])

@review.bookmarks.where(user: @current_user).delete_all
#because this pulls up a list just in case we have multiple bookmarks per user,  we need to delete all

redirect_to review_path(@review)

end


end
