class DonationsController < ApplicationController
  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      flash[:notice] = "Your donation for #{donation_params[:amount]} is being
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
    ).merge(user_id: current_user.id, amount: level.amount)
  end

  def receiving_project
    level.project
  end
end
