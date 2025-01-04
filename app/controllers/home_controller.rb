class HomeController < ApplicationController
  def index
    # @flash_sales = Tour.home_flash_sale
    @categories = Category.all
    @new_packages = Tour.home_new_packages
  end

  def about
  end

  def tour
    @tour = Tour.find(params[:id])
    @tour_inclusion = @tour.inclusion.split("\n");
    @tour_exclusion = @tour.exclusion.split("\n");
    @tour_terms_and_condition = @tour.terms_and_condition.split("\n");
  end

  def category
    if params[:id].present?
      @category = Category.find(params[:id])
      @tours = @category.tours
      @category_name = @category.name
    else
      @tours = Tour.new_packages
      @category_name = "New Packages"
    end
  end
end
