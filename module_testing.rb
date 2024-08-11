module Testing
  def print_name
    puts "Student name is: #{@name}"
  end
end

class Students

end

class Student
  include Testing
  # attr_accessor :name

  def initialize(name)
    @name = name
  end
end

stud = Student.new('Omkar')
stud.print_name