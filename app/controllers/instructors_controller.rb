class InstructorsController < ApplicationController
  def index
    all_instructors = Instructor.all
    render json: all_instructors  
    # render json: Instructor.all
  end

  def create
    new_instructor= Instructor.new(name: params[:name])
    if new_instructor.save #.valid? and saves if valid.
    render json: new_instructor
    else render json: {error: new_instructor.errors.full_messages}
    end
  end

  def update
    found_instructor=Instructor.find_by(id: params[:id])
    if !!found_instructor
      found_instructor.update(name: params[:name])
      render json: {message: "Index  #{[:id]} modified"}
    else
      render json: {error: "Could not find index #{[:id]}"}
    end
  end

   def destroy
    removable_instructor=Instructor.find_by(id: params[:id])
    if !!removable_instructor
      removable_instructor.destroy
      render json: {message: "Index  #{[:id]} deleted"}
    else
      render json: {error: "Could not find index #{[:id]}"}
    end
  end
end