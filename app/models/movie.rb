class Movie < ActiveRecord::Base
 
  mount_uploader :picture, PictureUploader
  
end
