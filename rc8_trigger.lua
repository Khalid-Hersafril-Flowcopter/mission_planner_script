local init_flag
local end_flag

pwm_threshold = 1900
RCIN9 = 59
RCIN10 = 60
MOTOR1 = 33
MOTOR2 = 34


gcs:send_text(6, 'LUA: RC8 Trigger script loaded')
local value = param:get('SCR_ENABLE')

function update() -- this is the loop which periodically runs
 
  init_flag = param:get('SERVO1_FUNCTION')

  if value then
    gcs:send_text(6, string.format('LUA: SCR_ENABLE: %i',value))
  elseif value == 0 then
    gcs:send_text(6, 'LUA: get SCR_ENABLE failed')
  end

  local chan_7_pwm = rc:get_pwm(7)
  
  if chan_7_pwm < pwm_threshold then

    if init_flag ~= end_flag then 
      gcs:send_text(6, string.format('LUA: SERVO1_FUNCTION set to %i', RCIN9))
      gcs:send_text(6, string.format('LUA: SERVO2_FUNCTION set to %i', RCIN10))
    end
   
    param:set('SERVO1_FUNCTION', RCIN9)
    param:set('SERVO2_FUNCTION', RCIN10)
  else 
    gcs:send_text(6, string.format('LUA: SERVO1_FUNCTION set to default value - %i', MOTOR1))
    gcs:send_text(6, string.format('LUA: SERVO2_FUNCTION set to default value - %i', MOTOR2))
    param:set('SERVO1_FUNCTION', MOTOR1)
    param:set('SERVO2_FUNCTION', MOTOR2)
  end

  end_flag = param:get('SERVO1_FUNCTION')
  return update, 100 -- reschedules the loop
end
return update, 100 -- run immediately before starting to reschedule
