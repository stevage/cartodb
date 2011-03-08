class Superadmin::UsersController < Superadmin::SuperadminController
  before_filter :get_user, :only => [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if params[:user]
      attributes = params[:user]
      @user.username = attributes[:username]
      @user.email    = attributes[:email]
      @user.password = attributes[:password]
      @user.admin    = attributes[:admin]
      if @user.save
        redirect_to superadmin_users_path, :flash => {:success => 'User updated successfully'}
      else
        render edit_superadmin_user_path(@user)
      end
    end
  end

  def get_user
    @user = User[params[:id]] if params[:id]
  end
  private :get_user
end