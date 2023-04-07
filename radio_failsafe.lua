local init_flag = param:get('SERVO7_FUNCTION')
local end_flag = param:get('SERVO7_FUNCTION')

local i = 0
local servo_channel = 6
local servo_pwm_signal = 1000
local RCIN7 = 57
local disable = 0


function update() -- this is the loop which periodically runs
   
    if i == 0 then 
        gcs:send_text(6, "LUA: Radio Failsafe Scripting initialised.")
    end

   --    gcs:send_text(6, 'LUA: Radio failsafe LUA script activated')
    init_flag = param:get('SERVO7_FUNCTION')
    local rc_connection_flag = rc:has_valid_input()

    if rc_connection_flag == false then
        
        param:set('SERVO7_FUNCTION', disable)
        SRV_Channels:set_output_pwm_chan(servo_channel, servo_pwm_signal)
        
        if init_flag ~= end_flag then
            gcs:send_text(6, "No RC Received!")
            gcs:send_text(6, string.format('LUA: Servo channel %i disabled (func_num: %i). PWM signal set to %i ', servo_channel + 1, disable, servo_pwm_signal))
        end

    else
        param:set('SERVO7_FUNCTION', RCIN7)

        if init_flag ~= end_flag then
            gcs:send_text(6, "RC connected!")
            gcs:send_text(6, string.format('LUA: Servo channel %i set to RCIN7 (func_num: %i). PWM signal set to %i ', servo_channel + 1, RCIN7, servo_pwm_signal))
        end

    end
    
    end_flag = init_flag
    i = i + 1
    return update, 100 -- reschedules the loop
 end
 return update, 100 -- run immediately before starting to reschedules 