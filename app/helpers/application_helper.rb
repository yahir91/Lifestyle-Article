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

  def check_vote(article)
    return vote_or_unvote_btn(article) if current_user
  end

  def default_image(cat)
    return image_tag(cat.image.url, class: 'cat-img') if cat.category
  end

  def category_link(cat)
    return link_to "#{cat.category.name} Games", category_path(cat.category.id), class: 'cat-links' if cat.category
  end

  def cat_title(cat)
    return cat.title if cat.category
  end
end
