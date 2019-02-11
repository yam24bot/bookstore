require 'test_helper'

class BookFileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_file_index_url
    assert_response :success
  end

  test "should get new" do
    get book_file_new_url
    assert_response :success
  end

  test "should get create" do
    get book_file_create_url
    assert_response :success
  end

  test "should get destroy" do
    get book_file_destroy_url
    assert_response :success
  end

end
