class Graph < ApplicationRecord
  
  def self.create(title, data, is_glycation = false)
    graph = Gruff::Line.new
    graph.title = title
    graph.labels = { 
      0 => '',
      288 => '5 a.m.',
      576 => '10 a.m.',
      864 => '3 p.m.',
      1152 => '8 p.m.',
      1440 => '12 a.m.'
    }
    data = data
    graph.data :current_user, data
    if !is_glycation
      graph.write('app/assets/images/glucose_graph.png')
    else
      graph.write('app/assets/images/glycation_graph.png')
    end
  end
end
