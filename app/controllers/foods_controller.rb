class FoodsController < ApplicationController
  def index
    @foods = Food.all
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :quantity)
  end
end