class ChargesController < ApplicationController
  DEFAULT_CURRENCY = "usd"

  def new
  end

  def create
    @amount = 500

    customer = Stripe::Customer.create(
      email: "example@stripe.com",
      card: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "GPH Test Stripe customer",
      currency: DEFAULT_CURRENCY
    )

  rescue Stripe::CardError => error
    flash[:error] = error.message
    redirect_to :charges
  end
end
