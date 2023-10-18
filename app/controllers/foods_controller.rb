class FoodsController < ApplicationController

  def index
    @foods = Food.all.order(created_at: 'desc')
  end


  def new
    #render form
  end

  def create
    new_food = Food.new(food_params)
    new_food.buyer_id = current_user.id

    if new_food.save
      flash[:notice] = 'New food created successfully!'
      redirect_to '/'

    else
      render :new, alert: "Failed to add a new food!"
    end

  end

  def destroy
    selected_food = Food.find(params[:id])
    if selected_food.destroy
      flash[:notice] = 'Successfully deleted'
      redirect_to request.referer
    else
      flash[:notice] = 'Failed to delete'
      redirect_to request.referer
    end
  end


  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

end