require 'test_helper'

class IndicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @index = indices(:one)
  end

  test "should get index" do
    get indices_url, as: :json
    assert_response :success
  end

  test "should create index" do
    assert_difference('Index.count') do
      post indices_url, params: { index: { content: @index.content, url: @index.url } }, as: :json
    end

    assert_response 201
  end

  test "should show index" do
    get index_url(@index), as: :json
    assert_response :success
  end

  test "should update index" do
    patch index_url(@index), params: { index: { content: @index.content, url: @index.url } }, as: :json
    assert_response 200
  end

  test "should destroy index" do
    assert_difference('Index.count', -1) do
      delete index_url(@index), as: :json
    end

    assert_response 204
  end
end
