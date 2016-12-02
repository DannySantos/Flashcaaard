module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def formatted(string)
    string = string.gsub("&", "&amp;").gsub("<", "&lt;")
    string = string.gsub(string[/\*\*(.*?)\*\*/], bolden(string[/\*\*(.*?)\*\*/])) if string[/\*\*(.*?)\*\*/]
    string = string.gsub(string[/\_(.*?)\_/], italicise(string[/\_(.*?)\_/])) if string[/\_(.*?)\_/]
    string = string.gsub(string[/\`(.*?)\`/], code_inline(string[/\`(.*?)\`/])) if string[/\`(.*?)\`/]
    string = string.gsub(string[/    .*$/], code_block(string[/    .*$/])) if string[/    .*$/]
    string = string.gsub(/\n/, '<br/>').gsub(/\n/, '<br/>').html_safe
  end
  
  def bolden(string)
    string.gsub(/\*\*(.*)\*\*/,'<b>\1</b>')
  end
  
  def italicise(string)
    string.gsub(/\_(.*)\_/,'<i>\1</i>')
  end
  
  def code_inline(string)
    string.gsub(/\`(.*)\`/,'<span class="code-inline">\1</span>')
  end
  
  def code_block(string)
    string.gsub(/    (.*$)/,'<span class="code-block"><pre>\1</pre></span>')
  end
end

