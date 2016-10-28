class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @recipes = Recipe.all.order("created_at DESC").paginate(page: params[:page], per_page:6)
  end

  def show

  end

  def new
    @recipe = current_user.recipes.new
  end

  def create
    @recipe = current_user.recipes.new recipe_params
    if @recipe.save
      redirect_to @recipe, notice:"Succesfully created new recipe"
    else
      render 'new'
    end
  end

  def destroy
    if current_user === @recipe.user
      @recipe.destroy
      redirect_to recipes_path
    else
      redirect_to @recipe
    end
  end

  def update
    if current_user === @recipe.user
      if @recipe.update recipe_params
        redirect_to @recipe, notice:"Succesfully updated the recipe"
      else
        render 'edit'
      end
    else
      redirect_to @recipe
    end
  end

  def edit
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, :image, directions_attributes: [:id, :step, :_destroy], ingredients_attributes: [:id, :name, :_destroy])
    end
end
