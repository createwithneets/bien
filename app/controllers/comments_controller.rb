class CommentsController < ApplicationController

def create

#find review that we are talking about
@review = Review.find(params[:review_id])
#we can't use (params[:id]) because we are in the COMMENT controller now so need to link to review ReviewsController
@comment = @review.comments.new(params.require(:comment). permit(:body))
#want to make a brand new comment to the review
@comment.save
#go back to review show page
redirect_to review_path(@review)
end

end
