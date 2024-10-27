class Admin::UsersController < AdminController
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

  private
  def admin_user_params
    params.require(:admin).permit(:email, :username, :password, :password_confirmation, :firstname, :lastname, :status)
  end
end
