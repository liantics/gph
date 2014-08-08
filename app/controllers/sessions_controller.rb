class SessionsController < ApplicationController
  before_filter :login_if_allowed
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :login_if_allowed, only: [:new, :destroy]


  def new
  end

  def create
    user = authenticate_session(session_params)
    if sign_in(user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def login_if_allowed
    user = User.find_by(email: session_params[:email])
    if user.account_enabled
      create
    else
      flash[:notice] = "User #{user.name} has been disabled"
      redirect_to root_path
    end
  end
end
