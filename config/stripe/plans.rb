# This file contains descriptions of all your stripe plans

# Example
# Stripe::Plans::PRIMO #=> 'primo'

Stripe.plan :one do |plan|
  # plan name as it will appear on credit card statements
  plan.name = 'GitGifts $1 Plan'
  # amount in cents. This is 6.99
  plan.amount = 1
  # currency to use for the plan (default 'usd')
  plan.currency = 'usd'
  # interval must be either 'week', 'month' or 'year'
  plan.interval = 'month'
  # # only bill once every three months (default 1)
  # plan.interval_count = 3
  # # number of days before charging customer's card (default 0)
  # plan.trial_period_days = 30
end

Stripe.plan :five do |plan|
  plan.name = 'GitGifts $5 Plan'
  plan.amount = 5
  plan.currency = 'usd'
  plan.interval = 'month'
end

Stripe.plan :ten do |plan|
  plan.name = 'GitGifts $10 Plan'
  plan.amount = 10
  plan.currency = 'usd'
  plan.interval = 'month'
end

Stripe.plan :twenty do |plan|
  plan.name = 'GitGifts $20 Plan'
  plan.amount = 20
  plan.currency = 'usd'
  plan.interval = 'month'
end

Stripe.plan :fifty do |plan|
  plan.name = 'GitGifts $50 Plan'
  plan.amount = 50
  plan.currency = 'usd'
  plan.interval = 'month'
end

Stripe.plan :hundred do |plan|
  plan.name = 'GitGifts $100 Plan'
  plan.amount = 100
  plan.currency = 'usd'
  plan.interval = 'month'
end

# Once you have your plans defined, you can run
#
#   rake stripe:prepare
#
# This will export any new plans to stripe.com so that you can
# begin using them in your API calls.
