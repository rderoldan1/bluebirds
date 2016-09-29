class IndicesController < ApplicationController
  before_action :set_index, only: [:show, :update, :destroy]

  # GET /indices
  def index
    @indices = Index.all

  end

  # GET /indices/1
  def show
  end

  # POST /indices
  def create
    @index = Index.new(index_params)

    if @index.save
      ExtractContentJob.perform_later(@index.id)
      render :show, status: :created, location: @index
    else
      render json: @index.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /indices/1
  def update
    if @index.update(index_params)
      render json: @index
    else
      render json: @index.errors, status: :unprocessable_entity
    end
  end

  # DELETE /indices/1
  def destroy
    @index.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_index
      @index = Index.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def index_params
      params.require(:index).permit(:url, :content)
    end
end
