class AddExerciseIndexColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :exercise_index, :integer
  end
end
