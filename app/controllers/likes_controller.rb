class LikesController < ApplicationController
  before_action :set_recipe, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(recipe_id: params[:recipe_id])
  end

  def destroy
    like = current_user.likes.find_by(recipe_id: params[:recipe_id])
    like.destroy
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
