#!/usr/bin/env ruby
# Author: 
#   Sabri | @KINGSABRI
# Description: 
#   
# Requirements: 
#   
class String
  def inverse
    self_binary = self.reverse.unpack('B*').join
    complement  = ~self_binary.to_i(2)
    binary_inv  = 31.downto(0).map { |n| complement[n] }.join

    parse_binary     = self_binary.split('').each_slice(8).to_a
    parse_binary_inv = binary_inv.split('').each_slice(8).to_a

    0.upto(3).map do |bit|
      if parse_binary[bit][0] == '1'
        parse_binary_inv[bit][0] = '0'
      else
        parse_binary_inv[bit][0] = '0'
      end
    end

    binary = parse_binary_inv.join
    hex    = binary.to_i(2).to_s(16)
    ascii  = [hex].pack('H*')

    puts '[!] The result is not printable(ASCII), choose another string!' unless ascii.ascii_only?
    [ascii, hex, binary]
  end
end

value    = ARGV[0]
original = [value.reverse, value.reverse.unpack('H*')[0], value.unpack('B*')[0]]
inverted = value.inverse

puts '[+] Original Value:'
puts "[•] ASCII : #{original[0]}"
puts "[•] Hex   : #{original[1]}"
puts "[•] Binary: #{original[2]}"
puts
puts '[+] Inverted Value:'
puts "[•] ASCII : #{inverted[0]}"
puts "[•] Hex   : #{inverted[1]}"
puts "[•] Binary: #{inverted[2]}"
