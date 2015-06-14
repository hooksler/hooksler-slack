require 'hooksler/slack/default_format'

module Hooksler
  module Slack
    class Output
      extend Hooksler::Channel::Output
      register :slack

      include DefaultFormat

      attr_accessor :channel, :username, :url

      def initialize(params={})
        @channel = '#general'
        @username = 'Hooksler'
        @url = nil

        [:channel, :username, :url].each do |s|
          send "#{s}=", params[s] if params.key?(s)
        end

        fail 'Incoming WebHooks URL missed' if @url.nil? || @url.to_s.empty?
      end

      def dump(message)

        formatter_name = "for_#{message.source}"
        payload = self.respond_to?(formatter_name, true) ? send(formatter_name, message) : for_default(message)

        send_data payload if payload
      end
      
      private
      
      def send_data(payload)
        HTTParty.post @url, body: MultiJson.dump(payload)
      end
    end
  end
end
