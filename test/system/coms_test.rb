require "application_system_test_case"

class ComsTest < ApplicationSystemTestCase
  setup do
    @com = coms(:one)
  end

  test "visiting the index" do
    visit coms_url
    assert_selector "h1", text: "Coms"
  end

  test "creating a Com" do
    visit coms_url
    click_on "New Com"

    fill_in "Content", with: @com.content
    fill_in "Post", with: @com.post_id
    fill_in "User", with: @com.user_id
    click_on "Create Com"

    assert_text "Com was successfully created"
    click_on "Back"
  end

  test "updating a Com" do
    visit coms_url
    click_on "Edit", match: :first

    fill_in "Content", with: @com.content
    fill_in "Post", with: @com.post_id
    fill_in "User", with: @com.user_id
    click_on "Update Com"

    assert_text "Com was successfully updated"
    click_on "Back"
  end

  test "destroying a Com" do
    visit coms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Com was successfully destroyed"
  end
end
