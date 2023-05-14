can_sim_path = "../can_simulation/can_sim/?.lua"
ardupilot_interpace_path = "../ardupilot-interface/?.lua"
package.path = package.path ..can_sim_path .. ardupilot_interpace_path 

require("can-simulation.can_sim")
require("ardupilot-interface.ground_control_station")
local socket = require("socket")

local gcs = GroundControlStation.new()

function update()
    gcs:send_text(0, "Test")
    return update, 1000
end

while true do
    _, time_delay = update() 
    socket.sleep(time_delay/1000)
end