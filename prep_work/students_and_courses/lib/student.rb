class Student
    attr_accessor :first_name, :last_name, :courses

    def initialize (first_name, last_name)
        @first_name = first_name
        @last_name = last_name
        @courses = []
    end
    
    def name
    first_name + " " + last_name
    end

    def enroll(course)
        raise "course would cause conflict!" if has_conflict?(course)

        if courses.include?(course) == false
            self.courses << course 
            course.students << self
        end
    end

    def course_load
        hsh = Hash.new(0)
        self.courses.each do |course|
            hsh[course.department] +=  course.credits
        end
        hsh
    end

    def has_conflict?(new_course)
        self.courses.any? do |enrolled_course|
            new_course.conflicts_with?(enrolled_course)
        end
    end

end
