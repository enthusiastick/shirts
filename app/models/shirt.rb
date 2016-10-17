class Shirt < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates_presence_of :name
end
