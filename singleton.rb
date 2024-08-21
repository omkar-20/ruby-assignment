
# singleton methods are the methods that can be defined for a specific object only i.e it works for a single object
class Singletontest
  def size
    puts '25'
  end
end

test1 = Singletontest.new
test2 = Singletontest.new

def test1.size
  puts '10'
end

test1.size
test2.size