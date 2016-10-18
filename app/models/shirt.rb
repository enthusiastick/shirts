class Shirt < ApplicationRecord
  attr_accessor :last_worn_today
  belongs_to :user

  mount_uploader :picture, PictureUploader
  validates_presence_of :name
end
