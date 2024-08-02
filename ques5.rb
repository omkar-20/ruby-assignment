INVALID_IP_ADDRESS_MESSAGE = "Invalid IP address"

def valid_ip_format?(ip_address)
  ip_format_regex = /\A(?:\d{1,3}\.){3}\d{1,3}\z/
  ip_address.match?(ip_format_regex)
end

def valid_ip_address?(octets)
  octets.all? do |octet|
    integer_octet = octet.to_i
    integer_octet.between?(0, 255) 
  end
end

def process_ip_address(ip_address)
  unless valid_ip_format?(ip_address)
    puts INVALID_IP_ADDRESS_MESSAGE
    return
  end
  split_address = ip_address.split('.')
  puts find_ip_class(split_address)  
end

def find_ip_class(octets)
  return INVALID_IP_ADDRESS_MESSAGE unless valid_ip_address?(octets)

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
    INVALID_IP_ADDRESS_MESSAGE
  end
end

puts 'Enter an IP address:'
ip_address = gets.chomp
process_ip_address(ip_address)
