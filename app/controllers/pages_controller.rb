class PagesController < ApplicationController

def about
@content= Page.find_by(url: "about")
end



def home
  @content= Page.find_by(url: "Home")

  @highly_rated_reviews= Review.where("score >= 8")

@featured_reviews= Review.where(is_featured: true)

end


end
