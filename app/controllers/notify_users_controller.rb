class NotifyUsersController < ApplicationController
  def create
    Subscription.all.each do |subscription|
      send_the_message(subscription, params)
    end
  end

  private

  def send_the_message(subscription, params)
    # message = {
    #   title: params[:title],
    #   body: params[:body],
    #   icon: 'http://www.clker.com/cliparts/1/0/9/e/1487324295866254597fire-vector-icon-png-27.med.png'
    # }

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
  end
end
