require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "creating a Room" do
    visit rooms_url
    click_on "New Room"

    fill_in "Adress", with: @room.adress
    fill_in "Age", with: @room.age
    fill_in "Name", with: @room.name
    fill_in "Note", with: @room.note
    fill_in "Rent", with: @room.rent
    click_on "作成します"

    assert_text "正しく作成されました"
    click_on "Back"
  end

  test "アップデートされました" do
    visit rooms_url
    click_on "Edit", match: :first
    fill_in "Adress", with: @room.adress
    fill_in "Age", with: @room.age
    fill_in "Name", with: @room.name
    fill_in "Note", with: @room.note
    fill_in "Rent", with: @room.rent
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "destroying a Room" do
    visit rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room was successfully destroyed"
  end
end
