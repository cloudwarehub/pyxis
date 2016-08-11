require 'jwt'
require 'active_support'
require 'securerandom'

class ClustersController < ApplicationController
  before_action :set_cluster, only: [:show, :update, :destroy]

  # GET /clusters
  def index
    @clusters = Cluster.all

    render json: @clusters
  end

  # GET /clusters/1
  def show
    @cluster.token = SecureRandom.uuid
    render json: @cluster
  end

  # POST /clusters
  def create
    @cluster = Cluster.new(cluster_params)


    if @cluster.save
      render json: @cluster, status: :created, location: @cluster
    else
      render json: @cluster.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clusters/1
  def update
    if @cluster.update(cluster_params)
      render json: @cluster
    else
      render json: @cluster.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clusters/1
  def destroy
    @cluster.destroy
  end

  def add_host_token
    if params[:get]
      token = Rails.cache.fetch(params[:get])
      render :text => token
    else
      token = SecureRandom.uuid
      Rails.cache.write(token, '1', time_to_idle: 60.seconds, timeToLive: 600.seconds)
      render :text => token

    end
    # payload = {:data => 'test'}
    # token = JWT.encode payload, nil, 'none'
    # puts token
    # decoded_token = JWT.decode token, nil, false
    # puts decoded_token
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
