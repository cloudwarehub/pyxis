require 'test_helper'

class ClustersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cluster = clusters(:one)
  end

  test "should get index" do
    get clusters_url, as: :json
    assert_response :success
  end

  test "should create cluster" do
    assert_difference('Cluster.count') do
      post clusters_url, params: { cluster: { isp: @cluster.isp, name: @cluster.name, region_id: @cluster.region_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cluster" do
    get cluster_url(@cluster), as: :json
    assert_response :success
  end

  test "should update cluster" do
    patch cluster_url(@cluster), params: { cluster: { isp: @cluster.isp, name: @cluster.name, region_id: @cluster.region_id } }, as: :json
    assert_response 200
  end

  test "should destroy cluster" do
    assert_difference('Cluster.count', -1) do
      delete cluster_url(@cluster), as: :json
    end

    assert_response 204
  end
end
