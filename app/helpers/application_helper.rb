module ApplicationHelper

  def gravatar_for(user, options = {size: 80, classes: 'img-circle'})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{options[:size]}"
    image_tag(url, class: options[:classes])
  end

end
