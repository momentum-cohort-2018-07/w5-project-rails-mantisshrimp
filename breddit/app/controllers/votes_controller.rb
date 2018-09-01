class VotesController < ApplicationController
  def create
    @vote = Vote.new(params.require(:vote).permit(:vote_value, :user_id, :post_id))
    @vote.save
    redirect_to post_path(@vote.post_id)
  end

  def update
  end
end
