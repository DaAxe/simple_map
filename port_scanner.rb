require 'socket'
require 'timeout'

puts "IP Address: " 
ip = gets.chomp
puts 'Scanning common ports'

ports = [53, 135, 137, 445, 1042, 1043, 2869, 5040]
ports.each do |scan|
    begin
            Timeout::timeout(3){TCPSocket.new("#{ip}", scan)}
    rescue => exception
        puts "closed: #{scan}"

    else
        puts "open: #{scan}"
    end  
end

sleep 4
puts 'Done! :-)'