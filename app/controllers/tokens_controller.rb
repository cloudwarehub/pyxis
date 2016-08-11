class TokensController < ApplicationController
  before_action :set_tokens, only: [:show, :update, :destroy]

  # GET /tokens
  def index
    @tokens = Cluster.all

    render json: @tokens
  end

  # GET /tokens/1
  def show
    render json: @cluster
  end

  # POST /tokens
  def create
    @cluster = Cluster.new(cluster_params)


    if @cluster.save
      render json: @cluster, status: :created, location: @cluster
    else
      render json: @cluster.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tokens/1
  def update
    if @cluster.update(cluster_params)
      render json: @cluster
    else
      render json: @cluster.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tokens/1
  def destroy
    @cluster.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cluster
    @cluster = Cluster.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cluster_params
    #ActiveModel::Serializer::Adapter::JsonApi::Deserialization.parse(params.to_h)
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params.to_unsafe_h)
    #params.require(:cluster).permit(:name, :description, :region_id)
  end
end
