-- Lua script for Port Scan, Banner Grab, and Headers with Output to TXT File

-- ASCII Banner
print("*
    __
   / /__  __ ____ _ _____ _____ ____ _ ____ 
  / // / / // __ `// ___// ___// __ `// __ \
 / // /_/ // /_/ /(__  )/ /__ / /_/ // / / /
/_/ \__,_/ \__,_//____/ \___/ \__,_//_/ /_/ 
            by @wint3rmute                *")

-- Prompt for user input
io.write("Enter the target IP address: ")
local targetIP = io.read()

-- Open a file for writing output
local outputFile = io.open("port_scan_output.txt", "w")

-- Function to perform Port Scan, Banner Grab, and Headers
function portScanBannerHeaders(targetIP)
    -- List of common ports to scan
    local ports = {21, 22, 80, 443, 8080}

    -- Loop through the ports
    for _, port in ipairs(ports) do
        -- Attempt to connect to the port
        local socket = require("socket")
        local client = socket.connect(targetIP, port)

        if client then
            -- Print and write to file: Port is open
            local portInfo = "Port " .. port .. " is open\n"
            print(portInfo)
            outputFile:write(portInfo)

            -- Receive banner information
            local banner, _, partial = client:receive(1024)
            if banner then
                -- Print and write to file: Banner for Port
                local bannerInfo = "Banner for Port " .. port .. ": " .. banner .. "\n"
                print(bannerInfo)
                outputFile:write(bannerInfo)
            elseif partial then
                -- Print and write to file: Banner for Port (partial)
                local partialBannerInfo = "Banner for Port " .. port .. ": " .. partial .. "\n"
                print(partialBannerInfo)
                outputFile:write(partialBannerInfo)
            end

            -- Get headers for HTTP ports (80 and 443)
            if port == 80 or port == 443 then
                client:send("HEAD / HTTP/1.1\r\nHost: " .. targetIP .. "\r\n\r\n")
                local headers, _, _ = client:receive(1024)
                if headers then
                    -- Print and write to file: Headers for Port
                    local headersInfo = "Headers for Port " .. port .. ":\n" .. headers .. "\n"
                    print(headersInfo)
                    outputFile:write(headersInfo)
                end
            end

            -- Close the connection
            client:close()
        else
            -- Print and write to file: Port is closed
            local closedPortInfo = "Port " .. port .. " is closed\n"
            print(closedPortInfo)
            outputFile:write(closedPortInfo)
        end
    end

    -- Close the output file
    outputFile:close()
end

-- Call the function with user-provided target IP
portScanBannerHeaders(targetIP)
