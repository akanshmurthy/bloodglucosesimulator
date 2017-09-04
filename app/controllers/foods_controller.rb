class FoodsController < ApplicationController
  def create
    @food = Food.search(params[:food][:name])
    if @food.nil?
      new_food = Food.new(food_params)
      new_food.glycemic_index = 50 #allows flexibility to enter new foods not in the DB for the future
      new_food.save
      create_event("food", new_food)
    else
      create_event("food", @food)
    end
    redirect_to root_url
  end

  private
  
  def create_event(type, food_object)
    new_event = Event.new
    new_event.event_type = "food"
    new_event.index = food_object.glycemic_index
    new_event.save
  end
  
  def food_params
    params.require(:food).permit(:name)
  end
end
