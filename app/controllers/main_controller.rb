class MainController < ApplicationController
  # add cancan authorizing
  # load_and_authorize_resource

  def index
    @posts = Post.all.order("created_at DESC")
  end

end
