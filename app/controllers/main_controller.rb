class MainController < ApplicationController
  # add cancan authorizing
  # load_and_authorize_resource

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 30).order("created_at DESC")
  end

end
