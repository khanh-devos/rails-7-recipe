class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(recipe_food_params)
      flash[:notice] = 'Successfully updated'
      redirect_to user_recipe_path(user_id: current_user.id, id: @recipe_food.recipe_id)
    else
      render :edit, alert: 'Failed to update'
    end
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])

    # Only show the food bought by logined-user or current_user
    @food_arr = Food.all.where(buyer_id: current_user.id).pluck(:name, :id)
  end

  def create
    new_recipe_food = RecipeFood.new(recipe_food_params)
    @recipe = Recipe.find(params[:recipe_id])
    new_recipe_food.recipe_id = @recipe.id

    if new_recipe_food.save
      flash[:notice] = 'New recipe created successfully'
      redirect_to user_recipe_path(user_id: current_user.id, id: @recipe.id)
    else
      render :new, alert: 'Failed to create a new recipe'
      # redirect_to request.referer
    end
  end

  def destroy
    selected_recipe_food = RecipeFood.find(params[:id])
    if selected_recipe_food.destroy
      flash[:notice] = 'Successfull deleted'
      redirect_to request.referer
    else
      flash[:alert] = 'Failed to delete'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
