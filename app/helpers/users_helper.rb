module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
    def gravatar_for(user, options = { size: 50 })
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
    
    def current_user?(user)
      user == current_user
    end
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
end