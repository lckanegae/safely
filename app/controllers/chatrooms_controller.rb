class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def create
    Chatroom.all.each do |chatroom|
      chat = chatroom.messages.where(user: current_user).first
      if chat.present?
        redirect_to chatroom_path(chatroom)
        return
      end
    end
    new_chatroom = Chatroom.create(name: current_user.nickname)
    redirect_to chatroom_path(new_chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
