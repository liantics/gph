class DonationsController < ApplicationController
  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      flash[:notice] = "Your donation for #{donation_params[:amount]} is being
        processed. Thank you #{current_user.name}!"

      redirect_to receiving_project
    else
      render root_path
    end
  end

  private

  def donation_params
    params.require(:donation).permit(
      :amount,
      :user_id,
      :level_id,
    )
  end

  def receiving_project
    level = Level.find(donation_params[:level_id])
    Project.find(level.project_id)
  end
end
