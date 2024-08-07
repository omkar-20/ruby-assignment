
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

my_organisation = Organization.new('Josh Software', '300', 'Pune', '2007')
puts my_organisation.name1
puts my_organisation.employees
my_organisation.employees = 200
puts my_organisation.employees
my_organisation.print_name
