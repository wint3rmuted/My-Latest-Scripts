#!/usr/bin/env ruby

require 'etc'

# Function to display an ASCII banner
def display_banner
  puts <<-'BANNER'
                   d8b                                                        
                   ?88                                                        
                    88b                                                       
  88bd88b?88   d8P  888888b ?88   d8P  d8888b  88bd88b ?88   d8P  88bd8b,d88b 
  88P'  `d88   88   88P `?8bd88   88  d8b_,dP  88P' ?8bd88   88   88P'`?8P'?8b
 d88     ?8(  d88  d88,  d88?8(  d88  88b     d88   88P?8(  d88  d88  d88  88P
d88'     `?88P'?8bd88'`?88P'`?88P'?8b `?888P'd88'   88b`?88P'?8bd88' d88'  88b
                                   )88                              
                                  ,d8P  Ruby Enumeration Script by @wint3rmute                                      
                               `?888P'                                        
                                                                      
  BANNER
end

# Function to gather system information
def gather_system_info
  system_info = {}

  # Kernel Information
  system_info[:kernel] = `uname -a`

  # OS Information
  system_info[:os] = `cat /etc/os-release`

  # Installed Tools
  system_info[:installed_tools] = `dpkg -l`

  # Interesting Directories
  system_info[:interesting_directories] = `ls -l / | grep "^d"`

  # Web Root Locations
  system_info[:web_root_locations] = `ls -l /var/www`

  # Environment Variables
  system_info[:environment_variables] = ENV.to_h

  # Users and Groups
  system_info[:users] = Etc.passwd
  system_info[:groups] = Etc.group

  # Networking Information
  system_info[:networking_info] = `ifconfig`

  # Internal Ports
  system_info[:internal_ports] = `netstat -tulpn`

  # Firewall Information (simplified)
  system_info[:firewall_info] = `iptables -L`

  # Printer Information
  system_info[:printer_info] = `lpstat -p`

  # Applications
  system_info[:applications] = `ls /usr/bin`

  # Services
  system_info[:services] = `systemctl list-units --type=service`

  # Packages
  system_info[:packages] = `dpkg -l`

  # Processes
  system_info[:processes] = `ps aux`

  # Save output to a .txt file (user input)
  print 'Enter the filename to save the output: '
  filename = gets.chomp
  File.write("#{filename}.txt", system_info.to_yaml)
  puts "Output saved to #{filename}.txt"
end

# Call the function to display the banner
display_banner

# Call the function to gather system information
gather_system_info
