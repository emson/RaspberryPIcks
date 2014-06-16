module ApplicationHelper

  def poster(post)
    user = User.find(post.user_id)
    user.username
  end

  def login_logout
    return link_to('login', new_user_session_path) unless user_signed_in?
    link_to("logout #{current_user.username}", destroy_user_session_path, method: :delete)
  end

  def register
    return if user_signed_in?
    content_tag(:li) do
      link_to('register', new_user_registration_path)
    end
  end

  def disabled_unless_loggedin
    return false if user_signed_in?
    true
  end

end
