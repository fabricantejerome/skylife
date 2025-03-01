class AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  
  def index
  end

  def banner
    @banner = Banner.first
    if @banner.nil?
      @banner = Banner.new
    end
  end

  def save_banner
   respond_to do |format|
    @banner = Banner.first

    if @banner.nil?
      @banner = Banner.new(banner_params)
      @banner.save
      format.html { redirect_to admin_banner_path, notice: "Banner header was created." }
      format.json { render :show, status: :created, location: @banner }
    elsif @banner.present?
      @banner.update(banner_params)
      format.html { redirect_to admin_banner_path, notice: "Banner header was updated." }
      format.json { render :show, status: :created, location: @banner }
    else
      format.html { render :banner }
      format.json { render json: @banner.errors, status: :unprocessable_entity }
    end
   end
  end


  private

  def banner_params
    params.require(:banner).permit(:attachment_type, :header_file)
  end
end
