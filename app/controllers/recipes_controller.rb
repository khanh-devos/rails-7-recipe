class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show]

  def index
    @recipes = Recipe.all.order(created_at: 'desc')
  end

  def show
    @recipe_foods = RecipeFood.all.where(recipe_id: params[:id])

    # @values = @recipe_foods.map do |item|
    #   item.quanity * Food.find(item.food_id)
    # end
  end

  def new
    # show the form
  end

  def modify_public
    selected_recipe = Recipe.find(params[:id])
    selected_recipe.update(public: !selected_recipe.public)
    redirect_to request.referer
  end

  def create
    new_recipe = Recipe.new(recipe_params)
    new_recipe.author_id = current_user.id

    if new_recipe.save
      flash[:notice] = 'New recipe created successfully'
      redirect_to '/'
    else
      render :new, alert: 'Failed to create a new recipe'
      # redirect_to request.referer
    end
  end

  def destroy
    selected_recipe = Recipe.find(params[:id])

    if selected_recipe.destroy
      flash[:notice] = 'Successfully deleted'
      redirect_to '/'

    else
      render :new, alert: 'Failed to delete'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
