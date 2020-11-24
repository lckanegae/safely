class ChatroomChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "Support"
  end

end
