class SimilaritiesController < ApplicationController
  before_action :set_similarity, only: [:edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]
  respond_to :html

 
  def new
    @similarity = Similarity.new
    respond_with(@similarity)
  end

  def edit
  end

  def create
    @similarity = Similarity.new(similarity_params)
    @similarity.user_id = current_user.id
    @similarity.movie_id = @movie.id

    flash[:notice] = "Similar movie was successfully created." if @similarity.save
    respond_with(@similarity, :location => movie_path(@movie))
  end




  def update
    @similarity.update(similarity_params)
        
    flash[:notice] = "Similarity was successfully updated." if @similarity.save
    respond_with(@similarity, :location => movie_path(@movie))
  end

  def destroy
    @similarity.destroy

   flash[:notice] = "Similarity was successfully destroyed." 
   respond_with(@similarity, :location => @movie)
  end

  private
    def set_similarity
      @similarity = Similarity.find(params[:id])
    end

    def set_movie
      @movie = Movie.find_by_permalink(params[:movie_id])
    end 

    def check_user
      unless (@similarity.user == current_user) || (current_user.admin?)
        redirect_to root_url, alert: "Sorry, this similarity belongs to someone else"
      end  
    end 

    def similarity_params
      params.require(:similarity).permit(:image, :name, :actor, :why)
    end
end
