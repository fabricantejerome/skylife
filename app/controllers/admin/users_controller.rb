class Admin::UsersController < AdminController
  before_action :set_admin_user, only: %i[ edit update ]

  def index
    @admin_users = Admin.all
  end

  def new
    @admin_user = Admin.new
  end

  def create
    @admin_user = Admin.new(admin_user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to admin_users_path, notice: "Admin user was successfully created." }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  # PATCH/PUT /admin/tours/1 or /admin/tours/1.json
  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to admin_users_path, notice: "Tour was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @admin_user] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = Admin.find(params[:id])
    end

    def admin_user_params
      params.require(:admin).permit(:email, :username, :password, :password_confirmation, :firstname, :lastname, :status)
    end
end
