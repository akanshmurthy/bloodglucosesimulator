class FoodsController < ApplicationController
  def create
    @food = Food.search(params[:food][:name])
    if @food.nil?
      new_food = Food.new(food_params)
      new_food.glycemic_index = 50 #arbitrary ... need a better way to gauge the average index
      new_food.save # don't necessarily need to save
      Blood_Sugar.update_blood_sugar_level(new_food.glycemic_index)
    else
      Blood_Sugar.update_blood_sugar_level(@food.glycemic_index)
    end
    redirect_to root_url
  end

  private
  def food_params
    params.require(:food).permit(:name)
  end
end
