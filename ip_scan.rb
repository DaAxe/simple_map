# Import ipaddr class
require 'ipaddr'

# Get user config
puts "Your currnet IP is: "
system ("ip -h addr | awk 'NR==9 {print $2}'")
puts "Enter your ip config [xxx.xxx.xxx]"
puts "This is the first 3 sets of numbers in your Ip address"
ip_config = gets.chomp 

# Define Ip-Range and output to array
ipadd_range = IPAddr.new("#{ip_config}" + ".0/24").to_range.to_a

#Map Ip range and for each Ip address do a ping call
ipadd_range.map do |ip|
    status = system("ping -q -c 1 -W 1  #{ip}")
    #Clear screen after ping
    system('clear')
    #If output contains string "true" then convert statuss to boolean == true
    if status.to_s.downcase.include? "true"
        status == true
    end 
    #if status is true, write Ip Address to file.txt
    if status == true
        puts "#{ip} found, writing to file..."
     File.open('active_ips.txt','a') {|file| file.write("#{ip}\n")}  
    else
     puts "#{ip} Ip not Found..."
    end 
end

