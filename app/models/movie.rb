class Movie < ActiveRecord::Base
  
  before_save :create_permalink
  mount_uploader :picture, PictureUploader
  
  def to_param
     permalink
  end 
  
  
  
  private
  def create_permalink
     self.permalink = title.downcase
  end
  
  has_many :reviews  
end
