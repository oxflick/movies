class Similarity < ActiveRecord::Base
	mount_uploader :image, PictureUploader
	belongs_to :user
end
