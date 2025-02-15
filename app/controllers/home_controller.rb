class HomeController < ApplicationController
  def index
    # @flash_sales = Tour.home_flash_sale
    # @categories = Category.all
    @categories = Category.order(created_at: :asc)
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
    @categories = Category.all
    if params[:id].present?
      @category = Category.find(params[:id])
      @tours = @category.tours
      @category_name = @category.name
    else
      @tours = Tour.new_packages
      @category_name = "New Packages"
    end
  end

  def search
    @categories = Category.all
    @tours = Tour.where("LOWER(name) LIKE ? OR LOWER(location) LIKE ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%").order(:created_at => :desc)
    @category_name = "Search results for '#{params[:q]}'"
  end
end
