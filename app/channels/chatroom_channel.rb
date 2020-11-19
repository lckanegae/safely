class ChatroomChannel < ApplicationCable::Channel
  
  def subscribed
    # stream_from "some_channel"
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom # "chatroom_1"
  end

end
