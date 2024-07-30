puts "enter ip address"
ip_address=gets.chomp
split_address=ip_address.split('.').map {|s| s.to_i}
if split_address.length != 4 || split_address.any? { |split_address| split_address < 0 || split_address > 255 }
 puts "invalid ip address"
else 
  valid_address=split_address[0]
  case valid_address
    when 1..126
      puts "Class A"
    when 128..191
      puts "Class B"
    when 192..223
      puts "Class C"
    when 224..239
      puts "Class D"
    when 240..255
      puts "Class E"
    else
      puts "Invalid IP address"
    end
  end
