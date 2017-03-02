class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      UnreadMessage.create(user_id: current_user.id, chat_room_id: @chat_room.id, read_messages: 0)
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    p "###################### #{@chat_room.messages.count}"
    UnreadMessage.find_by(user_id: current_user.id, chat_room_id: @chat_room.id).update_attributes(read_messages: @chat_room.messages.count)
    p "###################### #{UnreadMessage.find_by(user_id: current_user.id, chat_room_id: @chat_room.id).read_messages}"
    @chat_rooms_names = ChatRoom.all
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
