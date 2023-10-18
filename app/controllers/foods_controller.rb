class FoodsController < ApplicationController
  def index
    @foods = Food.includes(:user).all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(foods_params)
    if @food.save
      redirect_to foods_path, notice: 'Ingredient was successfully created'
    else
      redirect_to new_food_path, notice: 'Cannot create a new ingredient'
    end
  end

  def destroy
    @food = Food.includes(:user).find(params[:id])
    @food.destroy!
  
    redirect_to foods_path, notice: 'food successfully deleted'
  end

  private

  def foods_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity).merge(user_id: current_user.id)
  end
end