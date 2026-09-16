#!/usr/bin/env ruby

str = [] 
num = 0
ARGF.each_line do |x|
  x.chomp!
  if !x.empty?
    str.push(x.to_i)
    num += x.to_i
  end
end

if 0 == num
  puts num
else
  puts str.join(?+) + "=#{num}"
  puts str.join(?*) + "=" + str.reduce(&:*).to_s
end
