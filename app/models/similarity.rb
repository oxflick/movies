class Similarity < ActiveRecord::Base
	mount_uploader :image, PictureUploader
end
