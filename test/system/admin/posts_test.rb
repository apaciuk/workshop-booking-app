require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @admin_user = sign_in_admin_as(admin_users(:lazaro_nixon))
    @post = posts(:one)
  end

  test "visiting the index" do
    visit admin_posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit admin_posts_url
    click_on "New post"

    fill_in "Body", with: @post.body
    check "Published" if @post.published
    fill_in "Title", with: @post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
  end

  test "should update Post" do
    visit admin_post_url(@post)
    click_on "Edit post", match: :first

    fill_in "Body", with: @post.body
    check "Published" if @post.published
    fill_in "Title", with: @post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
  end

  test "should destroy Post" do
    visit admin_post_url(@post)
    page.accept_confirm { click_on "Delete post" }

    assert_text "Post was successfully destroyed"
  end
end
