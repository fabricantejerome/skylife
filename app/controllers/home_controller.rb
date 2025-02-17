class HomeController < ApplicationController
  def index
    @categories = Category.all.order(:priority)
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
    @categories = Category.all.order(:priority)
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
    @categories = Category.all.order(:priority)
    @tours = Tour.where("LOWER(name) LIKE ? OR LOWER(location) LIKE ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%").order(:created_at => :desc)
    @category_name = "Search results for '#{params[:q]}'"
  end
end
