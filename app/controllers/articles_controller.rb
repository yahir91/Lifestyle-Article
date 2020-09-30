class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_valid_user!, except: [:index]

  def index
    @articles = Article.all
    @top_article = Article.top_article
    @rpg_game = Article.top_game_category(1)
    @shooter_game = Article.top_game_category(2)
    @adventure_game = Article.top_game_category(3)
    @sport_game = Article.top_game_category(4)
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = current_user.articles.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def game_category_params
    params.require(:game_category).permit(:category_id)
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end
end
