require 'gruff'

class StaticPagesController < ApplicationController
  def root
  end
  
  def graphs
    graph = Gruff::Line.new
    graph.title = "Blood Sugar Levels Of The Day"
    graph.labels = { 
      0 => '12 a.m.', 
      1 => '1 a.m.', 
      2 => '2 a.m.', 
      3 => '3 a.m.', 
      4 => '4 a.m.',
      5 => '5 a.m.', 
      6 => '6 a.m.', 
      7 => '7 a.m.'
    }
    data = BloodSugar.where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:level)
    graph.data :current_user, data
    graph.write('graph.png')
  end
end
