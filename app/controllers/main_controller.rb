class MainController < ApplicationController
  # before_filter :authenticate_user!

  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at DESC")
  end

end
