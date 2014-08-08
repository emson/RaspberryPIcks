class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # add cancan authorizing
  load_and_authorize_resource

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 30).order("created_at DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    if user_signed_in?
      # merge current_user.id into params
      user_id = current_user.id
      merged_params = post_params.merge(user_id: user_id)
      @post = Post.new(merged_params)

      respond_to do |format|
        if @post.save
          # create the first vote for this post
          @post.votes.create(user_id: user_id)
          # redirect to main screen
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render action: 'show', status: :created, location: @post }
        else
          format.html { render action: 'new' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      @post = Post.new({})
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :url, :slug, :text, :points, :user_id)
  end

end
