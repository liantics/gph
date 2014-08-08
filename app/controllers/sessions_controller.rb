class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = authenticate_session(session_params)
    if sign_in(user)
      verify_user_allowed
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

  def verify_user_allowed
    if current_user.account_enabled
      redirect_to root_path
    else
      sign_out
      redirect_to root_path
    end
  end
end

