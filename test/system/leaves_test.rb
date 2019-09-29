require "application_system_test_case"

class LeavesTest < ApplicationSystemTestCase
  setup do
    @leafe = leaves(:one)
  end

  test "visiting the index" do
    visit leaves_url
    assert_selector "h1", text: "Leaves"
  end

  test "creating a Leave" do
    visit leaves_url
    click_on "New Leave"

    fill_in "From date", with: @leafe.from_date
    fill_in "Reason", with: @leafe.reason
    fill_in "Reporting head", with: @leafe.reporting_head_id
    fill_in "Status", with: @leafe.status
    fill_in "To date", with: @leafe.to_date
    fill_in "User", with: @leafe.user_id
    click_on "Create Leave"

    assert_text "Leave was successfully created"
    click_on "Back"
  end

  test "updating a Leave" do
    visit leaves_url
    click_on "Edit", match: :first

    fill_in "From date", with: @leafe.from_date
    fill_in "Reason", with: @leafe.reason
    fill_in "Reporting head", with: @leafe.reporting_head_id
    fill_in "Status", with: @leafe.status
    fill_in "To date", with: @leafe.to_date
    fill_in "User", with: @leafe.user_id
    click_on "Update Leave"

    assert_text "Leave was successfully updated"
    click_on "Back"
  end

  test "destroying a Leave" do
    visit leaves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leave was successfully destroyed"
  end
end
