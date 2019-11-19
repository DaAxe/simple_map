require 'socket'
require 'timeout'
require 'tty-progressbar'

system("clear")
puts "Your current IP is:"
system("ip -o -4  address show  | awk ' NR==2 { gsub(/\\/.*/, \"\", $4); print $4 } '")
puts ""
puts "Enter Your Target"
puts "  or"
puts "Press Enter for Local-Host IP"
puts "IP Address: "

# Loopback Adapter acts as local IP, by pressing enter it means 
# We are selecting Lo (127.0.0.1) 
ip = gets.chomp || "localhost"
puts 'Scanning common ports...'

# Progress Bar
bar = TTY::ProgressBar.new("Scanning [:bar]", total: 15)
15.times do
  sleep(0.1)
  bar.advance(1)
end


# Array for Port Range
port_range = [22, 53, 135, 137, 445, 631, 1042, 1043, 2869, 5040, 51330]
port_range.each do |port|
    begin
    socket = Timeout::timeout(3){TCPSocket.new(ip, port)}
    status = puts "Open: #{port}"
rescue
    Errno::ECONNREFUSED
    Errno::ETIMEDOUT
    status = puts "Closed: #{port}"
    end  
end
puts '[*] Scan Complete! :-)'
puts ""
puts ""
# Sub menu
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
    puts "Error: Invalid Input"
    puts "Does not compute"
end