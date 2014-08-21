class DonationsController < ApplicationController
  def create
    @donation = Donation.new(donation_params)

    if @donation.save
<<<<<<< HEAD
      flash[:notice] = "Your donation for #{@donation.amount} is being
       processed. Thank you #{current_user.name}!"
      redirect_to receiving_project
    else
      redirect_to root_path
=======
      flash[:notice] = "Your donation for #{donation_params[:amount]} is being processed. Thank you #{current_user.name}!"
      redirect_to receiving_project
    else
      render root_path
>>>>>>> Add donations to donation levels
    end
  end

  private

<<<<<<< HEAD
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
=======
  def donation_params
    params.require(:donation).permit(
      :amount,
      :user_id,
      :level_id,
    )
  end

  def receiving_project
    level = Level.find(donation_params[:level_id])
    project = Project.find(level.project_id)
>>>>>>> Add donations to donation levels
  end
end
