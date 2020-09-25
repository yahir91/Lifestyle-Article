# frozen_string_literal: true

class VotesController < ApplicationController
  def create
    @like = current_user.likes.new(article_id: params[:article_id])

    if @like.save
      redirect_to articles_path, notice: 'You vote a article.'
    else
      redirect_to articles_path, alert: 'You cannot vote this article.'
    end
    end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, post_id: params[:post_id])
    if like
      like.destroy
      redirect_to articles_path, notice: 'You unvoted a post.'
    else
      redirect_to articles_path, alert: 'You cannot unvote articles that you did not vote before.'
    end
  end
end
