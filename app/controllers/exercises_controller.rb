class ExercisesController < ApplicationController
  def create
    @exercise = Exercise.search(params[:exercise][:name])
    if @exercise.nil?
      new_exercise = Exercise.new(exercise_params)
      new_exercise.exercise_index = 50 #arbitrary ... need a better way to gauge the average index
      new_exercise.save # don't necessarily need to save
      BloodSugar.update_blood_sugar_level(new_exercise.exercise_index, "exercise")
    else
      BloodSugar.update_blood_sugar_level(@exercise.exercise_index, "exercise")
    end
    redirect_to root_url
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
