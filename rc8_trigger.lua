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

  local chan_7_pwm = rc:get_pwm(7)
  
  if chan_7_pwm < pwm_threshold then
    param:set('SERVO1_FUNCTION', RCIN9)
    param:set('SERVO2_FUNCTION', RCIN10)
  else 
    param:set('SERVO1_FUNCTION', MOTOR1)
    param:set('SERVO2_FUNCTION', MOTOR2)
  end
  end_flag = param:get('SERVO1_FUNCTION')

  -- Ensure that the message panel is not flooded
  if init_flag  ~= end_flag then
    gcs:send_text(6, string.format('LUA: SERVO1_FUNCTION set to %i', param:get('SERVO1_FUNCTION')))
    gcs:send_text(6, string.format('LUA: SERVO2_FUNCTION set to %i', param:get('SERVO2_FUNCTION')))
  end
  
  return update, 100 -- reschedules the loop
end
return update, 100 -- run immediately before starting to reschedule
