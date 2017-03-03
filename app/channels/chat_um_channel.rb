class ChatUmChannel < ApplicationCable::Channel
  def subscribed
     stream_from "chat_um"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
