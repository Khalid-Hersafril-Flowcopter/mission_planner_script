function update() -- this is the loop which periodically runs
  
   gcs:send_text(6, 'LUA: RC8 Trigger script loaded')
  -- get and print all the scripting parameters
  local value = param:get('SCR_ENABLE')

  if value then
    gcs:send_text(6, string.format('LUA: SCR_ENABLE: %i',value))
  elseif value == 0 then
    gcs:send_text(6, 'LUA: get SCR_ENABLE failed')
  end

  local chan_8_pwm = rc:get_pwm(7)
  
  pwm_threshold = 1900
  RCIN9 = 59
  RCIN10 = 60
  MOTOR1 = 33
  MOTOR2 = 34

  if chan_8_pwm < pwm_threshold then
    gcs:send_text(6, string.format('LUA: SERVO1_FUNCTION set to %i', RCIN9))
    gcs:send_text(6, string.format('LUA: SERVO2_FUNCTION set to %i', RCIN10))
    
    param:set_and_save('SERVO1_FUNCTION', RCIN9)
    param:set_and_save('SERVO2_FUNCTION', RCIN10)
  else 
    gcs:send_text(6, string.format('LUA: SERVO1_FUNCTION set to default value - %i', MOTOR1))
    gcs:send_text(6, string.format('LUA: SERVO2_FUNCTION set to default value - %i', MOTOR2))
    param:set_and_save('SERVO1_FUNCTION', MOTOR1)
    param:set_and_save('SERVO2_FUNCTION', MOTOR2)
  end
  return update, 100 -- reschedules the loop
end
return update, 100 -- run immediately before starting to reschedule
