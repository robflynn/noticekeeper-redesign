class ChatMessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ChatMessagesChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
