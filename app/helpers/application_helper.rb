module ApplicationHelper

  def set_support_chat
    Chatroom.find_by(name: "Support")
  end

end
