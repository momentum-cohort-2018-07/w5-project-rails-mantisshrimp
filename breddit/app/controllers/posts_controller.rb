class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post
    .left_joins(:votes)
    .group(:id)
    .order('SUM(votes.vote_value) DESC')
  end

  def my_posts
    @posts = Post
    .left_joins(:votes)
    .group(:id)
    .order('SUM(votes.vote_value) DESC')
    .where(user_id: current_user.id)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    if current_user
      @vote = Vote.where(user_id: current_user.id, post_id: @post.id)[0]
    end
    @votes_score = @post.votes.map{|vote| vote.vote_value}.inject(:+)

  end

  # GET /posts/new
  def new
    if current_user
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      redirect_to posts_path
    end
  end

  # POST /posts
  # POST /posts.json

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        vote = Vote.new(vote_value: 0, user_id: @post.user_id, post_id: @post.id)
        vote.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json

  def update
    if current_user.id == @post.user_id
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to posts_path
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    
    def post_params
      params.require(:post).permit(:title, :user_id, :description, :url)
    end
end
