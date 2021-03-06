class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
      flash[:notice] = "You are not authorized to access that account"
    end
  end

  def update
    user = User.find(params[:id])

    if current_user == user
      update_user(user)
    else
      redirect_to root_path
    end
  end

  def destroy
    user = User.find(params[:id])

    if current_user == user
      user.disable
      sign_out
      redirect_to root_path
      flash[:notice] = "User #{user.name} has been disabled"
    end
  end

  private

  def user_params
    params.require(:user).
      permit(
        :email,
        :name,
        :password,
    )
  end

  def edit_user_params
    params.require(:user).
      permit(
        :email,
        :name,
        :password,
        :image,
    )
  end

  def update_user(user)
    if user.update(edit_user_params)
      redirect_to user
    else
      render :edit
    end
  end
end
