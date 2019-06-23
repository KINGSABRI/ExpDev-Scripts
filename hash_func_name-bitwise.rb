#!/usr/bin/env ruby
# Author: 
#   Sabri | @KINGSABRI
# Description: 
#   
# Requirements: 
#   
# 
if ARGV.size < 1
  puts "[+] Usage:\n ruby #{$0} <STRING>"
  exit 0
end

class Integer
  def ror(count)
    (self >> count) | (self << (32 - count)) & 2**32-1
  end
end

esi = ARGV[0].chars
edx = 0x00
esi.each_with_index do |eax, i|
  edx = edx + eax.ord
  edx = edx.ror(0xd) unless i >= (esi.size - 1)   # Remove last character
end

puts "0x%02x" % edx
