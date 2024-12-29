class Admin::ToursController < AdminController
  before_action :set_admin_tour, only: %i[ show edit update destroy ]

  # GET /admin/tours or /admin/tours.json
  def index
    @admin_tours = Tour.all
  end

  # GET /admin/tours/1 or /admin/tours/1.json
  def show
  end

  # GET /admin/tours/new
  def new
    @admin_tour = Tour.new
  end

  # GET /admin/tours/1/edit
  def edit
  end

  # POST /admin/tours or /admin/tours.json
  def create
    @admin_tour = Tour.new(admin_tour_params)

    respond_to do |format|
      if @admin_tour.save
        format.html { redirect_to admin_tours_path, notice: "Tour was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @admin_tour] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tours/1 or /admin/tours/1.json
  def update
    respond_to do |format|
      if @admin_tour.update(admin_tour_params)
        format.html { redirect_to admin_tours_path, notice: "Tour was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @admin_tour] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tours/1 or /admin/tours/1.json
  def destroy
    @admin_tour.destroy!

    respond_to do |format|
      format.html { redirect_to admin_tours_path, status: :see_other, notice: "Tour was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_tour
      @admin_tour = Tour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_tour_params
      params.require(:tour).permit(:package, :price_per_head, :name, :location, :promo, :promo_price, :inclusion, :exclusion, :travel_date, :terms_and_condition, :notes, :meta_title, :meta_description, :keywords, :google_analytics_tracking_id, :conversion_tracking_setup, :facebook, :instagram, :tiktok, :category_id, :featured_image, :banner_image, gallery_images: [])
    end
end
