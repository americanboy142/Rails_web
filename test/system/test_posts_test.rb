require "application_system_test_case"

class TestPostsTest < ApplicationSystemTestCase
  setup do
    @test_post = test_posts(:one)
  end

  test "visiting the index" do
    visit test_posts_url
    assert_selector "h1", text: "Test posts"
  end

  test "should create test post" do
    visit test_posts_url
    click_on "New test post"

    fill_in "Body", with: @test_post.body
    fill_in "Title", with: @test_post.title
    click_on "Create Test post"

    assert_text "Test post was successfully created"
    click_on "Back"
  end

  test "should update Test post" do
    visit test_post_url(@test_post)
    click_on "Edit this test post", match: :first

    fill_in "Body", with: @test_post.body
    fill_in "Title", with: @test_post.title
    click_on "Update Test post"

    assert_text "Test post was successfully updated"
    click_on "Back"
  end

  test "should destroy Test post" do
    visit test_post_url(@test_post)
    click_on "Destroy this test post", match: :first

    assert_text "Test post was successfully destroyed"
  end
end
