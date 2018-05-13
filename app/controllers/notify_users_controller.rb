class NotifyUsersController < ApplicationController
  def create
    Subscription.all.each do |subscription|
      send_the_message(subscription)
    end
  end

  private

  def send_the_message(subscription)
    Webpush.payload_send(
      message: build_message_object,
      endpoint: subscription.endpoint,
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

  def build_message_object
    {
      title: params[:title],
      body: params[:body],
      icon: 'https://goo.gl/G6Nofu',
      link: params[:link]
    }.to_json
  end
end
