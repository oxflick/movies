class Similarity < ActiveRecord::Base
	mount_uploader :image, PictureUploader
	belongs_to :user
	belongs_to :movie

	validates :image, :name, :actor, :why, presence: true
end
