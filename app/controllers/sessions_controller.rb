class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = authenticate_session(session_params)
    login_if_allowed(session_params[:email])
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def login_if_allowed(email)
    user = User.find_by(email: email)

    if user.account_enabled
      login(user)
    else
      flash[:notice] = "User #{user.name} has been disabled"
      redirect_to root_path
    end
  end

  def login(user)
    if sign_in(user)
      redirect_to root_path
    else
      render :new
    end
  end
end
