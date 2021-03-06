class DonationsController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      flash[:notice] = "Your donation for $#{@donation.amount} is being
      processed. Thank you #{current_user.name}!"
      redirect_to receiving_project
    else
      redirect_to root_path
    end
  end

  private

  def level
    Level.find(params[:level_id])
  end

  def donation_params
    params.permit(
      :level_id,
    ).merge(
      user_id: current_user.id,
      amount: level.amount,
      project_id: level.project_id
    )
  end

  def receiving_project
    level.project
  end
end
