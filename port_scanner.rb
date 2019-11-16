require 'socket'
require 'timeout'


puts "Your current IP is:"
system("ip addr | awk '/inet /{ print $2 }' |tail -n -1")
puts ""
puts "Enter Your Target"
puts "IP Address: " 
ip = gets.chomp
puts 'Scanning common ports'

ports = [22, 53, 135, 137, 445, 1042, 1043, 2869, 5040, 51330]
begin
ports.each do |scan|

    socket = Timeout::timeout(3){TCPSocket.new("#{ip}", scan)}
    status = puts "open: #{scan}"
rescue
    Errno::ECONNREFUSED
    Errno::ETIMEDOUT
    status = puts "closed: #{$scan}"
    end  
end
sleep 4
puts 'Done! :-)'



puts "Would you like to: "
puts "----------------"
puts "1. Return to main menu"
puts "2. Quit"
puts ""
user_input = gets.chomp

if user_input == "1"
require "./menu"

elsif user_input == "2"
    exit

else
    "Does not compute"
end