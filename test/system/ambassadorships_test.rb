require "application_system_test_case"

class AmbassadorshipsTest < ApplicationSystemTestCase
  setup do
    @ambassadorship = ambassadorships(:one)
  end

  test "visiting the index" do
    visit ambassadorships_url
    assert_selector "h1", text: "Ambassadorships"
  end

  test "creating a Ambassadorship" do
    visit ambassadorships_url
    click_on "New Ambassadorship"

    click_on "Create Ambassadorship"

    assert_text "Ambassadorship was successfully created"
    click_on "Back"
  end

  test "updating a Ambassadorship" do
    visit ambassadorships_url
    click_on "Edit", match: :first

    click_on "Update Ambassadorship"

    assert_text "Ambassadorship was successfully updated"
    click_on "Back"
  end

  test "destroying a Ambassadorship" do
    visit ambassadorships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ambassadorship was successfully destroyed"
  end
end
