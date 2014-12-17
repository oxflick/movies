class ReviewsController < ApplicationController
  before_action :set_review, only: [ :edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]
  respond_to :html
  


  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id
    
    flash[:notice] = "Review was successfully created." if @review.save
    respond_with(@review, :location => movie_path(@movie))

  end

  def update
    @review.update(review_params)

    flash[:notice] = "Review was successfully updated." if @review.save
    respond_with(@review, :location => movie_path(@movie))
  end

  def destroy
    @review.destroy

   flash[:notice] = "Review was successfully destroyed." 
   respond_with(@review, :location => @movie)

  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find_by_permalink(params[:movie_id])
    end 

    def check_user
      unless (@review.user == current_user) || (current_user.admin?)
        redirect_to root_url, alert: "Sorry, this review belongs to someone else"
      end  
    end 

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
