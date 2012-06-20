class CourseImageJob < Struct.new(:id)
 def perform
   course = Course.find(id)

    if course
      course.regenerate_styles!
    end
 end
end