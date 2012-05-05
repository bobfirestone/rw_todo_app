module ApplicationHelper
  def display_flash_message
    [:notice, :success, :alert, :warning, :error].each do |message|
      return content_tag(:div, flash[message], :class => message) if flash[message]
    end unless flash.empty?
  end
  
  def avatar(email, options = {})
    require 'digest/md5'
    hash = Digest::MD5.hexdigest(email)
    image_src = url_for({:host => "www.gravatar.com/avatar/#{hash}", :d => 'mm'}.merge(options))
    image_tag(image_src, :alt => 'Gravatar Image')
  end
end
