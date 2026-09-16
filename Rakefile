task default: %w[result.txt]

file "result.txt" => ['first.txt', 'second.txt', 'multiplexer.rb'] do |t|
  p "The rake works! #{t.to_s}"
  sh "./multiplexer.rb first.txt second.txt > result.txt"
end
