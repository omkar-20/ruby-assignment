def is_prime_check?(num)
  i = 2
  while i*i < num
  if num % i == 0
    return false
  end
  i+=1
end
return true
end

puts 'Enter a number:'
num=gets.to_i
if num <= 1
  puts 'not a prime number'
else
  is_prime=is_prime_check?(num)
  if is_prime
    puts 'it is a prime number'
  else 
    puts 'not a prime number'
  end
end

