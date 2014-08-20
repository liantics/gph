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
  def donation_params
    params.require(:donation).permit(
      :amount,
      :level_id,
    ).merge(user_id: current_user.id)
  end

  def receiving_project
    level = Level.find(donation_params[:level_id])
    Project.find(level.project)
  end
end
