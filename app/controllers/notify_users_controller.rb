class NotifyUsersController < ApplicationController
  def create
    Subscription.all.each do |subscription|
      send_the_message(subscription, params)
    end
  end

  private

  def send_the_message(subscription, params)
    Webpush.payload_send(
      endpoint: subscription.endpoint,
      message: params[:body],
      p256dh: subscription.p256dh,
      auth: subscription.auth,
      vapid: {
        subject: 'mailto:derek@digitalderek.com',
        public_key: ENV['VAPID_PUBLIC'],
        private_key: ENV['VAPID_PRIVATE']
      }
    )
  rescue Webpush::InvalidSubscription => e
    puts "this is the error: #{e}"
  end
end
