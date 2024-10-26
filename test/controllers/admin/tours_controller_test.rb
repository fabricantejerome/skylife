require "test_helper"

class Admin::ToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_tour = admin_tours(:one)
  end

  test "should get index" do
    get admin_tours_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_tour_url
    assert_response :success
  end

  test "should create admin_tour" do
    assert_difference("Admin::Tour.count") do
      post admin_tours_url, params: { admin_tour: { category_id: @admin_tour.category_id, conversion_tracking_setup: @admin_tour.conversion_tracking_setup, exclusion: @admin_tour.exclusion, facebook: @admin_tour.facebook, google_analytics_tracking_id: @admin_tour.google_analytics_tracking_id, inclusion: @admin_tour.inclusion, instagram: @admin_tour.instagram, keywords: @admin_tour.keywords, location: @admin_tour.location, meta_description: @admin_tour.meta_description, meta_title: @admin_tour.meta_title, name: @admin_tour.name, notes: @admin_tour.notes, package: @admin_tour.package, price_per_head: @admin_tour.price_per_head, promo: @admin_tour.promo, promo_price: @admin_tour.promo_price, terms_and_condition: @admin_tour.terms_and_condition, tiktok: @admin_tour.tiktok, travel_date: @admin_tour.travel_date } }
    end

    assert_redirected_to admin_tour_url(Admin::Tour.last)
  end

  test "should show admin_tour" do
    get admin_tour_url(@admin_tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_tour_url(@admin_tour)
    assert_response :success
  end

  test "should update admin_tour" do
    patch admin_tour_url(@admin_tour), params: { admin_tour: { category_id: @admin_tour.category_id, conversion_tracking_setup: @admin_tour.conversion_tracking_setup, exclusion: @admin_tour.exclusion, facebook: @admin_tour.facebook, google_analytics_tracking_id: @admin_tour.google_analytics_tracking_id, inclusion: @admin_tour.inclusion, instagram: @admin_tour.instagram, keywords: @admin_tour.keywords, location: @admin_tour.location, meta_description: @admin_tour.meta_description, meta_title: @admin_tour.meta_title, name: @admin_tour.name, notes: @admin_tour.notes, package: @admin_tour.package, price_per_head: @admin_tour.price_per_head, promo: @admin_tour.promo, promo_price: @admin_tour.promo_price, terms_and_condition: @admin_tour.terms_and_condition, tiktok: @admin_tour.tiktok, travel_date: @admin_tour.travel_date } }
    assert_redirected_to admin_tour_url(@admin_tour)
  end

  test "should destroy admin_tour" do
    assert_difference("Admin::Tour.count", -1) do
      delete admin_tour_url(@admin_tour)
    end

    assert_redirected_to admin_tours_url
  end
end
