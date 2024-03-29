#!/usr/bin/env ruby

require 'socket'
require 'timeout'

# Function to display an ASCII banner
def display_banner
  puts <<-'BANNER'

██████╗  ██████╗ ██████╗ ████████╗███████╗ ██████╗ █████╗ ███╗   ██╗   ██████╗ ██████╗ 
██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝██╔════╝██╔══██╗████╗  ██║   ██╔══██╗██╔══██╗
██████╔╝██║   ██║██████╔╝   ██║   ███████╗██║     ███████║██╔██╗ ██║   ██████╔╝██████╔╝
██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║██║     ██╔══██║██║╚██╗██║   ██╔══██╗██╔══██╗
██║     ╚██████╔╝██║  ██║   ██║   ███████║╚██████╗██║  ██║██║ ╚████║██╗██║  ██║██████╔╝
╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═════╝ 
                                                              by wint3rmute ツ                               
  BANNER
end

# Function to perform a port scan and banner grab
def port_scan_and_banner_grab(target, start_port, end_port)
  open_ports = []

  puts "Scanning ports #{start_port} to #{end_port} on #{target}..."

  (start_port..end_port).each do |port|
    begin
      Timeout.timeout(1) do
        socket = TCPSocket.new(target, port)
        banner = socket.recv(1024)
        socket.close
        open_ports << { port: port, banner: banner }
        puts "Port #{port} is open - Banner: #{banner.strip}"
      end
    rescue Timeout::Error, StandardError
      next
    end
  end

  open_ports
end

# Function to save output to a .txt file
def save_to_file(data, filename)
  File.write(filename, data.to_yaml)
  puts "Output saved to #{filename}.txt"
end

# Main program
display_banner

# Get user input for target and port range
print 'Enter the target IP address or hostname: '
target = gets.chomp

print 'Enter the starting port: '
start_port = gets.chomp.to_i

print 'Enter the ending port: '
end_port = gets.chomp.to_i

# Perform the port scan and banner grab
open_ports = port_scan_and_banner_grab(target, start_port, end_port)

# Display the result
if open_ports.empty?
  puts "No open ports found on #{target}."
else
  puts "Open ports on #{target}: #{open_ports.map { |p| p[:port] }.join(', ')}"
  print 'Enter the filename to save the output: '
  filename = gets.chomp
  save_to_file(open_ports, filename)
end
