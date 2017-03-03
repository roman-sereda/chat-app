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
    @chat_room = current_chat
    @message = Message.new
    @chat_list = ChatRoom.all.map {|chat| {id: chat.id, title: chat.title, unread_mess: unread(chat.id)}}
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end

  def current_chat
    ChatRoom.find_by(id: params[:id])
  end

  def unread(chat_id)
    UnreadMessage.find_by(user_id: current_user, chat_room_id: chat_id).read_messages
  end

end
