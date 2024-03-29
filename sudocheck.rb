#!/usr/bin/env ruby

# Function to display an ASCII banner
def display_banner
  puts <<-'BANNER'
                   __           __              __          __  
   _______  ______/ /___  _____/ /_  ___  _____/ /__  _____/ /_ 
  / ___/ / / / __  / __ \/ ___/ __ \/ _ \/ ___/ //_/ / ___/ __ \
 (__  ) /_/ / /_/ / /_/ / /__/ / / /  __/ /__/ ,< _ / /  / /_/ /
/____/\__,_/\__,_/\____/\___/_/ /_/\___/\___/_/|_(_)_/  /_.___/ 
                                    by wint3rmute          
                                                      
  BANNER
end

# Function to check sudo rights
def check_sudo_rights
  sudo_rights = `sudo -l`

  if sudo_rights.include?('not allowed to run sudo')
    puts "You do not have sudo rights."
  else
    puts "You have sudo rights."
  end
end

# Function to check if the user is in the sudoers group
def check_sudoers_group
  sudoers_group = `cat /etc/group | grep sudo`

  if sudoers_group.empty?
    puts "You are not in the sudoers group."
  else
    puts "You are in the sudoers group."
  end
end

# Function to save output to a .txt file
def save_to_file(data, filename)
  File.write(filename, data)
  puts "Output saved to #{filename}.txt"
end

# Main program
display_banner

# Check sudo rights and sudoers group
check_sudo_rights
check_sudoers_group

# Prompt user for a filename to save the output
print 'Enter the filename to save the output: '
filename = gets.chomp

# Save the output to a .txt file
output = "Sudo Rights:\n#{`sudo -l`}\n\nSudoers Group:\n#{`cat /etc/group | grep sudo`}"
save_to_file(output, filename)
