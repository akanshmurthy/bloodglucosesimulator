class AddGlycemicIndexColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :glycemic_index, :integer
  end
end
