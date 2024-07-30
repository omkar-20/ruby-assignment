
def valid_ip_address?(ip_address)
  ip_address.strip!

  octets = ip_address.split('.')

  return false unless octets.length == 4

  octets.all? do |octet|
    integer_octet = octet.to_i
    integer_octet.between?(0, 255) && octet == integer_octet.to_s
  end
end

def find_ip_class(ip_address)
  return 'Invalid IP address' unless valid_ip_address?(ip_address)

  split_address = ip_address.split('.').map { |s| s.to_i }
  first_octet = split_address[0]

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
  end
end

puts 'Enter an IP address:'
ip_address = gets.chomp
puts find_ip_class(ip_address)