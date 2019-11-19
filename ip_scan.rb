class IP_Scan
    # Import ipaddr class
    require 'ipaddr'

    # Get user config
    puts "Your current IP is: "
    #system ("ip -h addr | awk 'NR==9 {print $2}'")
    system("ip -o -4  address show  | awk ' NR==2 { gsub(/\\/.*/, \"\", $4); print $4 } '")
    puts "Enter your ip config [xxx.xxx.xxx]"
    puts "(This is the first 3 sets of numbers in your Ip address)"
    ip_config = gets.chomp 

    # Define Ip-Range and output to array
    ipadd_range = IPAddr.new("#{ip_config}" + ".0/24").to_range.to_a

    # Added so the full range isn't scanned - takes too long, need to replace with gem tty prompt
    #shortened_range = ipadd_range.keep_if { |element| ipadd_range.index(element) < 10 }

    array = []
    #Map Ip range and for each Ip address do a ping call
    # shortened_range.map do |ip|
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
            array.push(ip)
        else
            puts "#{ip} Ip not Found..."
        end 
    end
    File.open('active_ips.txt','w') {|file| file.write(array.join("\n"))}  
end
require './display_1'
