require "application_system_test_case"

class Admin::ToursTest < ApplicationSystemTestCase
  setup do
    @admin_tour = admin_tours(:one)
  end

  test "visiting the index" do
    visit admin_tours_url
    assert_selector "h1", text: "Tours"
  end

  test "should create tour" do
    visit admin_tours_url
    click_on "New tour"

    fill_in "Category", with: @admin_tour.category_id
    fill_in "Conversion tracking setup", with: @admin_tour.conversion_tracking_setup
    fill_in "Exclusion", with: @admin_tour.exclusion
    fill_in "Facebook", with: @admin_tour.facebook
    fill_in "Google analytics tracking", with: @admin_tour.google_analytics_tracking_id
    fill_in "Inclusion", with: @admin_tour.inclusion
    fill_in "Instagram", with: @admin_tour.instagram
    fill_in "Keywords", with: @admin_tour.keywords
    fill_in "Location", with: @admin_tour.location
    fill_in "Meta description", with: @admin_tour.meta_description
    fill_in "Meta title", with: @admin_tour.meta_title
    fill_in "Name", with: @admin_tour.name
    fill_in "Notes", with: @admin_tour.notes
    fill_in "Package", with: @admin_tour.package
    fill_in "Price per head", with: @admin_tour.price_per_head
    fill_in "Promo", with: @admin_tour.promo
    fill_in "Promo price", with: @admin_tour.promo_price
    fill_in "Terms and condition", with: @admin_tour.terms_and_condition
    fill_in "Tiktok", with: @admin_tour.tiktok
    fill_in "Travel date", with: @admin_tour.travel_date
    click_on "Create Tour"

    assert_text "Tour was successfully created"
    click_on "Back"
  end

  test "should update Tour" do
    visit admin_tour_url(@admin_tour)
    click_on "Edit this tour", match: :first

    fill_in "Category", with: @admin_tour.category_id
    fill_in "Conversion tracking setup", with: @admin_tour.conversion_tracking_setup
    fill_in "Exclusion", with: @admin_tour.exclusion
    fill_in "Facebook", with: @admin_tour.facebook
    fill_in "Google analytics tracking", with: @admin_tour.google_analytics_tracking_id
    fill_in "Inclusion", with: @admin_tour.inclusion
    fill_in "Instagram", with: @admin_tour.instagram
    fill_in "Keywords", with: @admin_tour.keywords
    fill_in "Location", with: @admin_tour.location
    fill_in "Meta description", with: @admin_tour.meta_description
    fill_in "Meta title", with: @admin_tour.meta_title
    fill_in "Name", with: @admin_tour.name
    fill_in "Notes", with: @admin_tour.notes
    fill_in "Package", with: @admin_tour.package
    fill_in "Price per head", with: @admin_tour.price_per_head
    fill_in "Promo", with: @admin_tour.promo
    fill_in "Promo price", with: @admin_tour.promo_price
    fill_in "Terms and condition", with: @admin_tour.terms_and_condition
    fill_in "Tiktok", with: @admin_tour.tiktok
    fill_in "Travel date", with: @admin_tour.travel_date
    click_on "Update Tour"

    assert_text "Tour was successfully updated"
    click_on "Back"
  end

  test "should destroy Tour" do
    visit admin_tour_url(@admin_tour)
    click_on "Destroy this tour", match: :first

    assert_text "Tour was successfully destroyed"
  end
end
