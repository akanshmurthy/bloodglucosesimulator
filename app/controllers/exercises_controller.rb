class ExercisesController < ApplicationController
  def create
    @exercise = Exercise.search(params[:exercise][:name])
    if @exercise.nil?
      new_exercise = Exercise.new(exercise_params)
      new_exercise.exercise_index = 50 #allows flexibility to enter new foods not in the DB for the future
      new_exercise.save
      create_event("exercise", new_exercise)
    else
      create_event("exercise", @exercise)
    end
    redirect_to root_url
  end

  private
  
  def create_event(type, exercise_object)
    new_event = Event.new
    new_event.event_type = "exercise"
    new_event.index = exercise_object.exercise_index
    new_event.save
  end
  
  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
