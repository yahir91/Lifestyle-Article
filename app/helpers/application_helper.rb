# frozen_string_literal: true

module ApplicationHelper
  def login_logout
    if current_user
      link_to 'LOGOUT', logout_path
    else
      link_to 'LOGIN', login_path
    end
  end

  def vote_or_unvote_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Unvote!', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('Vote!', article_votes_path(article_id: article.id), method: :post)
    end
  end
end
