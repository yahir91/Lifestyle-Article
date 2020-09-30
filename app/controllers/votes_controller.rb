class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_to request.referrer, notice: 'You vote a article.'
    else
      redirect_to request.referrer, alert: 'You cannot vote this article.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to request.referrer, notice: 'You unvoted a post.'
    else
      redirect_to request.referrer, alert: 'You cannot unvote articles that you did not vote before.'
    end
  end
end
