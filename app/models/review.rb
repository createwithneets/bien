class Review < ApplicationRecord


validates :title, presence: true
#validating title, to make sure its there

validates :body, length: { minimum: 10 }
  #validating body that there is at least 10 characters

validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

validates :restaurant, presence: true


def to_param
  id.to_s + "-" + title.parameterize
  #changing the default from a number to a string
  #adding a dash between id and title
  #turning the title into URL form
end


end
