class Movie < ActiveRecord::Base
  
  before_save :create_permalink
  mount_uploader :picture, PictureUploader

  searchkick
  
  def to_param
     permalink
  end 
  
  
  
  private
  def create_permalink
     self.permalink = title.downcase.parameterize.underscore
  end
  
  has_many :reviews  
  has_many :similarities
end
