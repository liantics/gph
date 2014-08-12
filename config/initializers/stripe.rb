Rails.configuration.stripe = {
  :publishable_key => ENV.fetch("STRIPE_TEST_PUBLIC_KEY"),
  :secret_key      => ENV.fetch("STRIPE_TEST_SECRET_KEY")
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
