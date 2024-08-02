puts 'Enter the grades:'
grade = gets.to_i

if grade <= 0
  puts 'invalid grade'
elsif (1..5).include?(grade)
  puts 'elementary'
elsif (6..8).include?(grade)
  puts 'middle school'
elsif (9..12).include?(grade)
  puts 'high school'
else
  puts 'college'
end