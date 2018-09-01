class CommentsController < ApplicationController
  def new
    if current_user
      @comment = Comment.new
    else
      redirect_to posts_path
    end
  end

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_text, :user_id, :post_id)
    end
end
