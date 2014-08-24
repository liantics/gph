class SessionsController < ApplicationController
  before_action :require_enabled_account, only: [:create]
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def new_session_modal
  end

  def create_session_modal
    user = authenticate_session(session_params)

    if request.xhr?
      if sign_in(user)
        redirect_to nothing: true, status: 200
      else
        render :new
      end
    end
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
    params.require(:session).permit(
      :email,
      :password)
  end

  def require_enabled_account
    user = User.find_by(email: session_params[:email])
    if ! user.account_enabled
      flash[:notice] = "User #{user.name} has been disabled"
      redirect_to root_path
    end
  end
end
