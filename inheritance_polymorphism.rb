
class Organization
  attr_accessor :name1, :employees, :location, :founded

  def initialize(name, employees, location, founded)
    @name1 = name
    @employees = employees
    @location = location
    @founded = founded
  end  
  
  def print_name
    puts name1
  end
end

class BusinessUnit < Organization
  def initialize(name, employees, location, founded, department)
    super(name, employees, location, founded)
    @department = department
  end

  def print_name
    puts name1
  end

  def department
    @department
  end
end

business_unit = BusinessUnit.new('Josh Software', '300', 'Pune', '2007', 'Data Engineering')
puts business_unit.employees
puts business_unit.department
puts business_unit.print_name