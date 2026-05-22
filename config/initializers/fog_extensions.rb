# Wrap Fog real requests with notifications

# TODO: create/discover safer way to get notifications on requests
# Change 'request' method to send an activesupport notification
request_with_notifications = %q{
  alias_method :request_without_notifications, :request

  def request(params, &block)
    ActiveSupport::Notifications.instrument('request.fog', :object => self, :params => params) do
      request_without_notifications(params, &block)
    end
  end
}

# INCLUDE FOR FOG DEBUGGING
#classes = [Fog::Storage::AWS::Real]
#classes.each do |klass|
#  klass.class_eval(request_with_notifications)
#end

