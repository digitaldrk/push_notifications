class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    formatted = format_subscription_params(params.to_unsafe_h.deep_symbolize_keys)
    subscription = Subscription.new(formatted)

    if subscription.save
      render json: { data: { success: true} }
    else
      render json: {
        error: {
          id: 'unable-to-save-subscription',
          message: 'The subscription was received but we were unable to save it to our database.'
        }
      }
    end
  end

  private

  def format_subscription_params(subscription_params)
    {
      endpoint: subscription_params[:endpoint],
      p256dh: subscription_params[:keys][:p256dh],
      auth: subscription_params[:keys][:auth]
    }
  end
end
