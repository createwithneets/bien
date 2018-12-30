class Page < ApplicationRecord

  validates :url, uniqueness: true


  mount_uploader :image, ContentImagesUploader
end
