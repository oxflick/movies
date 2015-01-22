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
    respond_to do |format|
      if @similarity.update(similarity_params)
        format.html { redirect_to @similarity, notice: 'Similar movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @similarity }
      else
        format.html { render :edit }
        format.json { render json: @similarity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @similarity.destroy
    respond_with(@similarity)
  end

  private
    def set_similarity
      @similarity = Similarity.find(params[:id])
    end

    def set_movie
      @movie = Movie.find_by_permalink(params[:movie_id])
    end 

    def similarity_params
      params.require(:similarity).permit(:image, :name, :actor, :why)
    end
end
