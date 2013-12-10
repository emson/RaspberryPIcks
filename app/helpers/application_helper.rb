module ApplicationHelper

  def poster(post)
    user = User.find(post.user_id)
    user.username
  end

  def login_logout
    return link_to('login', new_user_session_path) unless user_signed_in?
    link_to("logout #{current_user.username}", destroy_user_session_path, method: :delete)
  end

end
