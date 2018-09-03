class VotesController < ApplicationController
  def create
    if current_user
      @vote = Vote.where(user_id: current_user.id, post_id: params[:vote][:post_id])[0]
      if @vote
        @vote.update(params.require(:vote).permit(:vote_value, :user_id, :post_id))
      else
        @vote = Vote.new(params.require(:vote).permit(:vote_value, :user_id, :post_id))
        @vote.save
      end
    end
    redirect_to posts_path
  end

  def update
    @vote = Vote.find(params[:id])
    if current_user == @vote.user_id
      @vote.update(params.require(:vote).permit(:vote_value, :user_id, :post_id))
    end
    redirect_to post_path(@vote.post_id)
  end

end
