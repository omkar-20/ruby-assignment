puts "Enter a number:"
nums=gets.to_i
if nums<=1
  puts "not a prime number"
else
  is_prime=true
  for i in 2..(nums/2)
  if nums%i==0
    is_prime=false
    break
  end
  end
  if is_prime
    puts "it is a prime number"
  else 
    puts "not a prime number"
  end
end
