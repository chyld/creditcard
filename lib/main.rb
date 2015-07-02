require_relative './card.rb'

if ARGV[0] == '--file'
  file = ARGV[1]
end

exit 1 if file.nil?

clients = {}

File.readlines(file).each do |line|
  line = line.split(' ')
  case line[0]
    when 'Add'
      clients[line[1]] = Card.new(line[1], line[2], line[3])
    when 'Charge'
      clients[line[1]].charge(line[2])
    when 'Credit'
      clients[line[1]].credit(line[2])
  end
end

clients.keys.sort.each do |name|
  puts clients[name]
end
