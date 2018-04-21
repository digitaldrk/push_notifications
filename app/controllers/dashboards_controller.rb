class DashboardsController < ApplicationController
  def index
    @subscriptions = Subscription.all.count
  end
end
