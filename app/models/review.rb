class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :movie
	
	scope :pending, where(:publish => false)
	scope :approved, where(:publish => true)


validates :rating, presence: true
validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: "can only be a whole number between 1 and 5"
  }

validates :user_id, :uniqueness => { :scope => :movie_id,
    :message => "can only write one review per movie."
}
validates_length_of :comment,
    :minimum => 80,
    :maximum => 5000,
    :allow_blank => true


end
