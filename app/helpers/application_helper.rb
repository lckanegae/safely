module ApplicationHelper

  def set_support_chat
    Chatroom.find_by(name: "Support")
  end

  def calculate_total_price(all_user_items)
    sum = 0.0
    all_user_items.each do |item|
      sum += item.total_price
    end
    humanized_money_with_symbol(sum)    
  end
end
