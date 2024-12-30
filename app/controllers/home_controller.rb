class HomeController < ApplicationController
  def index
    @flash_sales = Tour.home_flash_sale
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
end
