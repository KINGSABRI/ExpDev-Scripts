#!/usr/bin/env ruby
# Author: 
#   Sabri | @KINGSABRI
# Description: 
#   
# Requirements: 
#   

#
# ror_str rotates a given value(Hex) 13(0xd) times by 1 bit
# Example: byte = 0x41
#  00000000000000000000000001000001 as the original binary value
#  10000000000000000000000000100000 as frist round
#  00000010000010000000000000000000 as 13th  round
# 
# @params [Integer] byte: Takes a hex value
#
def ror(byte)
  binb = byte.to_s(2).to_s.rjust(32, '0')       # convert to binary and make sure it's 32-bit binary
  0xd.times { binb = binb[-1] + binb[0..-2] }   # rotate last right bit to the benging of the left side
  binb.to_i(2)
end

if ARGV.size < 1
  puts "[+] Usage:\n ruby #{$0} <STRING>"
  exit 0
end

esi = ARGV[0].chars
edx = 0x00
esi.each_with_index do |eax, i|
  edx = edx + eax.ord
  edx = ror(edx) unless i >= (esi.size - 1)   # Remove last character
end

puts "0x%02x" % edx
