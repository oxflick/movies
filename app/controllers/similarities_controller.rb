class SimilaritiesController < ApplicationController
  before_action :set_similarity, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @similarities = Similarity.all
    respond_with(@similarities)
  end

  def show
    respond_with(@similarity)
  end

  def new
    @similarity = Similarity.new
    respond_with(@similarity)
  end

  def edit
  end

  def create
    @similarity = Similarity.new(similarity_params)
   

    respond_to do |format|
      if @similarity.save
        format.html { redirect_to @similarity, notice: 'Similar movie was successfully created.' }
        format.json { render :show, status: :created, location: @similarity }
      else
        format.html { render :new }
        format.json { render json: @similarity.errors, status: :unprocessable_entity }
      end
    end



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

    def similarity_params
      params.require(:similarity).permit(:image, :name, :actor, :why)
    end
end
