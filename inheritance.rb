class Ruby
  def initialize
    puts "Superclass"
  end

  def super_method
    puts 'super class method'
  end
end

class Inheritance < Ruby
  def initialize
    puts "sub class"
  end
  def super_method
    puts "sub class method"
  end
end

# Ruby.new
# sub_obj = Inheritance.new
# sub_obj.super_method


# super in inheritance

class Test1

  def display a=0, b=0
    puts "Parent class, 1st argument: #{a}, 2nd argument: #{b}"
  end
end

class Test2 < Test1
  def display a, b
    super

    super a

    super a, b

    super()

    puts "this is subclass"
  end
end

# Test1.ancestors
# test = Test2.new
# test.display 'hi', 'good morning'


#ancestor chain in inheritance

module Adoptable
  def adoptable?
    true
  end

  def food_preference
    puts 'I am vegeterian'
  end

  def speak
    puts 'Meow2'
  end
end

module Runnable
  def run
    puts 'I can run'
  end

  def breathe
    puts 'Inhale and exhale2'
  end
end 

class Mammal
  def breathe
    puts 'Inhale and exhale'
  end
end

class Cat < Mammal
  include Runnable
  prepend Adoptable
  
  def initialize(name)
    puts name
  end
  def speak
    puts 'Meow'
  end
end

cat =  Cat.new('kitty')
cat.speak
cat.food_preference
cat.breathe
puts Cat.ancestors

