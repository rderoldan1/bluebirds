require 'test_helper'

class ElementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @element = elements(:one)
  end

  test "should get index" do
    get elements_url, as: :json
    assert_response :success
  end

  test "should create element" do
    assert_difference('Element.count') do
      post elements_url, params: { element: { content: @element.content, index_id: @element.index_id, type: @element.type } }, as: :json
    end

    assert_response 201
  end

  test "should show element" do
    get element_url(@element), as: :json
    assert_response :success
  end

  test "should update element" do
    patch element_url(@element), params: { element: { content: @element.content, index_id: @element.index_id, type: @element.type } }, as: :json
    assert_response 200
  end

  test "should destroy element" do
    assert_difference('Element.count', -1) do
      delete element_url(@element), as: :json
    end

    assert_response 204
  end
end
