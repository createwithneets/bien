class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :body, presence: true

  profanity_filter :body
  #we put the thing we want to not swear
end
