puts "Enter the grades:"
grades=gets.to_i

if grades>=1 && grades<=5
  puts "elementary"
elsif grades>=6 && grades<=8
  puts "middle school"
elsif grades>=9 && grades<=12
  puts "high school"
else
  puts "college"
end