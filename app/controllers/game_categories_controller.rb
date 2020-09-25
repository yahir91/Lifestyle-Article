# frozen_string_literal: true

class GameCategoriesController < ApplicationController
  before_action :set_game_category, only: %i[show edit update destroy]

  # GET /game_categories
  # GET /game_categories.json
  def index
    @game_categories = GameCategory.all
  end

  # GET /game_categories/1
  # GET /game_categories/1.json
  def show; end

  # GET /game_categories/new
  def new
    @game_category = GameCategory.new
  end

  # GET /game_categories/1/edit
  def edit; end

  # POST /game_categories
  # POST /game_categories.json
  def create
    @game_category = GameCategory.new(game_category_params)

    respond_to do |format|
      if @game_category.save
        format.html { redirect_to @game_category, notice: 'Game category was successfully created.' }
        format.json { render :show, status: :created, location: @game_category }
      else
        format.html { render :new }
        format.json { render json: @game_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_categories/1
  # PATCH/PUT /game_categories/1.json
  def update
    respond_to do |format|
      if @game_category.update(game_category_params)
        format.html { redirect_to @game_category, notice: 'Game category was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_category }
      else
        format.html { render :edit }
        format.json { render json: @game_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_categories/1
  # DELETE /game_categories/1.json
  def destroy
    @game_category.destroy
    respond_to do |format|
      format.html { redirect_to game_categories_url, notice: 'Game category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game_category
    @game_category = GameCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_category_params
    params.require(:game_category).permit(:category_id, :article_id)
  end
end
