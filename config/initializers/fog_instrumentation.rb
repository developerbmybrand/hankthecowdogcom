# Log fog requests in Rails
# Based on:
# https://gist.github.com/566725
module FogInstrumentation

  # Subscriber borrows heavily from 
  # https://github.com/rails/rails/blob/master/activerecord/lib/active_record/log_subscriber.rb
  class LogSubscriber < ActiveSupport::LogSubscriber
    def self.runtime=(value)
      Thread.current[:fog_runtime] = value
    end

    def self.runtime
      Thread.current[:fog_runtime] ||= 0
    end

    def self.reset_runtime
      rt, self.runtime = runtime, 0
      rt
    end

    def self.count=(value)
      Thread.current[:fog_count] = value
    end

    def self.count
      Thread.current[:fog_count] ||= 0
    end

    def self.reset_count
      c, self.count = count, 0
      c
    end
    
    def request(event)
      self.class.runtime += event.duration
      self.class.count += 1
      return unless logger.debug?

      klass = event.payload[:object].class
      friendly_name = klass.to_s.split('::')[0,3] * ' '
      name = '%s (%.1fms)' % ["#{friendly_name} Request", event.duration]

      debug "  #{color(name, GREEN, true)}  [ #{color(event.payload[:params].inspect, WHITE)} ]"
    end
  end

  # Controller borrows heavily from
  # https://github.com/rails/rails/blob/master/activerecord/lib/active_record/railties/controller_runtime.rb
  module ControllerRuntime
    extend ActiveSupport::Concern

    protected

    attr_internal :fog_runtime
    def cleanup_view_runtime
      fog_rt_before_render = FogInstrumentation::LogSubscriber.reset_runtime
      runtime = super
      fog_rt_after_render = FogInstrumentation::LogSubscriber.reset_runtime
      self.fog_runtime = fog_rt_before_render + fog_rt_after_render
      runtime - fog_rt_after_render
    end

    def append_info_to_payload(payload)
      super
      payload[:fog_runtime] = fog_runtime
    end

    module ClassMethods
      def log_process_action(payload)
        fog_requests = FogInstrumentation::LogSubscriber.reset_count
        messages, fog_runtime = super, payload[:fog_runtime]

        messages << ("Fog: %.1fms, %d reqs" % [fog_runtime.to_f, fog_requests]) if fog_runtime
        messages
      end
    end
  end
  
end

FogInstrumentation::LogSubscriber.attach_to :fog
ActiveSupport.on_load(:action_controller) do
  include FogInstrumentation::ControllerRuntime
end

