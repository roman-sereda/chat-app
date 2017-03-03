class ChatUmJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActionCable.server.broadcast "chat_um", chat_id: render_id
  end

  private

  def render
    current_user.chats.find(chat_id)
  end

end
