class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only:[:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    @recipes = Recipe.search(params[:search])
  end

  def show
    @comment = @recipe.comments.build
    @comments = @recipe.comments
  end

  def new
    if params[:back]
      @recipe = Recipe.new(recipes_params)
    else
      @recipe = Recipe.new
    end
  end

  def create
    @recipe = Recipe.new(recipes_params)
    @recipe.user_id = current_user.id
    @recipe.image.retrieve_from_cache! params[:cache][:image]
    if @recipe.save
      redirect_to recipes_path,notice:"レシピを投稿しました"
      NoticeMailer.sendmail_recipe(@recipe).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.user_id = current_user.id
    @recipe.update(recipes_params)
    redirect_to recipes_path,notice:"レシピを更新しました"
  end
end

  def destroy
    if @recipe.user_id = current_user.id
    @recipe.destroy
    redirect_to recipes_path,notice:"レシピを削除しました"
  end
end

  def confirm
    @recipe = Recipe.new(recipes_params)
    render :new if @recipe.invalid?
  end


  private
  def recipes_params
    params.require(:recipe).permit(:name,:explain,:ingredients,:directions,:image,:image_cache)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
