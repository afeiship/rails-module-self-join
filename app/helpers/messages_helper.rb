module MessagesHelper
  def nested_messages(messages)
    # 1. render(message) 会自动查找 _message.html.erb 的模板
    # 2. 并且把 message 这个数据传给这个模板
    messages.map do |message, sub_messages|
      render(message) + content_tag(:div, nested_messages(sub_messages), :class => "nested_messages")
    end.join.html_safe
  end
end
