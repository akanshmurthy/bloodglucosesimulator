class StaticPagesController < ApplicationController
  def root
  end
  
  def graphs
    Graph.create("Blood Sugar Levels Of The Day", Event.calculate_blood_sugar)
    Graph.create("Glycation Per Day", Event.calculate_blood_sugar(true), true)
  end
end