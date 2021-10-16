class StudentsController < ApplicationController
    def index
      all_students = Student.all
      render json: all_students  
      # render json: Student.all
    end
  
    def create
      new_student= Student.new(student_params)
      if !!new_student.save #.valid? and saves if valid.
      render json: new_student
      else render json: {error: new_student.errors.full_messages}
      end
    end
  
    def update
      found_student=Student.find_by(id: params[:id])
      if !!found_student
        found_student.update(student_params)
        if found_student.valid?
            render json: found_student
        else 
            render json: {error: found_student.errors.full_messages}
        end
      else
        render json: {error: "Student is not here"}
      end
    end
  
     def destroy
      removable_student=Student.find_by(id: params[:id])
      if !!removable_student
        removable_student.destroy
        render json: {message: "Index  #{[:id]} deleted"}
      else
        render json: {error: "Could not find studentindex #{[:id]}"}
      end
    end

    private

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
        
    end
  end