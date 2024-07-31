def valid_ip_format?(ip_address)
  ip_format_regex = /\A(?:\d{1,3}\.){3}\d{1,3}\z/
  if ip_address.match?(ip_format_regex)
    true
  else
    false
  end
end

def valid_ip_address?(octets)
  octets.all? do |octet|
    integer_octet = octet.to_i
    integer_octet.between?(0, 255) 
  end
end

def find_ip_class(octets)
  return 'Invalid IP address' unless valid_ip_address?(octets)

  first_octet = octets[0].to_i

  case first_octet
  when 1..126
    'Class A'
  when 128..191
    'Class B'
  when 192..223
    'Class C'
  when 224..239
    'Class D'
  when 240..255
    'Class E'
  else
    'Invalid IP address'
  end
end

puts 'Enter an IP address:'
ip_address = gets.chomp
if valid_ip_format?(ip_address)
  split_address = ip_address.split('.')
  puts find_ip_class(split_address)
else
  puts 'Invalid IP address'
end
