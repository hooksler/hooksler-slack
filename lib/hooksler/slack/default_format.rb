module Hooksler
  module Slack
    module DefaultFormat
      def for_default(message)
        text = message.message
        {
            text: text,
            channel: self.channel,
            username: (message.user || self.username)
        }
      end
    end
  end
end
