module ApplicationHelper
  def gravatar_for(user,options = {size:80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "img-circle")
  end
  
  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert_success"
      when :info then "alert alert_info"
      when :alert then "alert alert_danger"
      when :warning then "alert alert_warning"
    end
  end
  
  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
