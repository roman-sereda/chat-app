# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"

  end

  def unsubscribed
    UnreadMessage.find(user_id: current_user.id,
                       chat_room_id: params[:id]).read_messages = ChatRoom.find(params[:id]).count_messages
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end
end
