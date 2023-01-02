require "test_helper"

class TestPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_post = test_posts(:one)
  end

  test "should get index" do
    get test_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_test_post_url
    assert_response :success
  end

  test "should create test_post" do
    assert_difference("TestPost.count") do
      post test_posts_url, params: { test_post: { body: @test_post.body, title: @test_post.title } }
    end

    assert_redirected_to test_post_url(TestPost.last)
  end

  test "should show test_post" do
    get test_post_url(@test_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_post_url(@test_post)
    assert_response :success
  end

  test "should update test_post" do
    patch test_post_url(@test_post), params: { test_post: { body: @test_post.body, title: @test_post.title } }
    assert_redirected_to test_post_url(@test_post)
  end

  test "should destroy test_post" do
    assert_difference("TestPost.count", -1) do
      delete test_post_url(@test_post)
    end

    assert_redirected_to test_posts_url
  end
end
