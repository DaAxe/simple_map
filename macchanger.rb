#Module to get MAC
def get_mac_addr
 mac = system ("ip addr | awk '/ether/{ print $2 }'")
end


 get_mac_addr()