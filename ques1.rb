def is_prime_check?(num)
  i = 2
  while i*i < num
    return false if num % i == 0
    i+=1
  end
  true
end

puts 'Enter a number:'
num = gets.to_i

if num <= 1
  puts 'not a prime number'
  exit
end

is_prime = is_prime_check?(num)
unless is_prime
  puts 'not a prime number'
  exit
end

puts 'it is a prime number'
  
    
