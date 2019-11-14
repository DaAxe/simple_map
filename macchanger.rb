
#Module to get MAC
def get_mac_addr
 dmac = system ("ip addr | awk '/ether/{ print $2 }'")
end

# Clear Screen
system('clear')

#Display current MAC
puts 'Your current MAC Address is: ' 
get_mac_addr()

puts ""
puts ""
puts  'Would you like to:'
puts '------------------'
puts ' 1. Change your MAC Address'
puts ' 2. Back to Main'
puts ' 3. Quit'
puts ""
puts "Select number (1-3)"
user_input = gets.chomp

# Clear Screen
system('clear')
if user_input ==  "1"
  
  # Enter Network Adapter
  system("ip addr | awk '/: /{ print $1,$2 }' | sed 's/:/ /2'")
  puts "Enter your Network Interface: (eg. eth0 || wlan0 || enp0s3)"
  $interf = gets.chomp
  
  # Display current MAC
  puts 'Your current MAC Address is: ' 
  get_mac_addr()
  puts ""
  puts 'Enter new MAC [xx:xx:xx:xx:xx:xx]'
  puts ""
  $mac = gets.chomp
  
  puts ""
  puts 'Ethernet down...'
  # system('sudo ifconfig eth0 down')
  system('sudo systemctl stop NetworkManager.service')
  puts 'Changhing MAC'  
  # system('sudo ifconfig eth0 hw ether  ')
  system('sudo ip link set dev ' + $interf + ' address ' + $mac)

  puts 'Network Starting...'  
  system('sudo systemctl start NetworkManager.service')
  # system('sudo ifconfig eth0 up')  
  puts 'Done!' 
  

elsif user_input == "2"
  require './menu.rb'

elsif user_input == "3"
  exit

else
  puts "Does not compute"


end