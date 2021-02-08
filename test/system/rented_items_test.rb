require "application_system_test_case"

class RentedItemsTest < ApplicationSystemTestCase
  setup do
    @rented_item = rented_items(:one)
  end

  test "visiting the index" do
    visit rented_items_url
    assert_selector "h1", text: "Rented Items"
  end

  test "creating a Rented item" do
    visit rented_items_url
    click_on "New Rented Item"

    click_on "Create Rented item"

    assert_text "Rented item was successfully created"
    click_on "Back"
  end

  test "updating a Rented item" do
    visit rented_items_url
    click_on "Edit", match: :first

    click_on "Update Rented item"

    assert_text "Rented item was successfully updated"
    click_on "Back"
  end

  test "destroying a Rented item" do
    visit rented_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rented item was successfully destroyed"
  end
end
