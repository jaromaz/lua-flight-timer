-- LuaTimer v. 1.0 FlyWithLua script by Jaromaz 

require "HUD"

dataref("sec", "sim/cockpit2/clock_timer/elapsed_time_seconds", "readonly")
dataref("min", "sim/cockpit2/clock_timer/elapsed_time_minutes", "readonly")
dataref("hou", "sim/cockpit2/clock_timer/elapsed_time_hours", "readonly")
dataref("run", "sim/cockpit2/clock_timer/timer_running", "readonly")

HUD.begin_HUD( -81, 350, 80, 106, "luatimer", "always")
HUD.create_click_action(50, 1, 30, 35, 'command_once("sim/instruments/timer_reset")')
HUD.create_click_action(0, 0, 50, 35, 'command_once("sim/instruments/timer_start_stop")')
HUD.create_backlight_indicator( 50, 0, 30, 35, "run == 0 and hou == 0 and min == 0 and sec == 0", 0.5, 0, 0, 0.5)
HUD.create_backlight_indicator( 0, 0, 50, 35, "run == 1", 0, 0.5, 0, 0.5)

-- title 
HUD.create_element("jtm", 0, 71, 80, 35)
HUD.draw_string(10, 10, 18, "TIMER")

-- timer
HUD.create_element("jss", 0, 36, 80, 35)
HUD.draw_fstring(4, 11, 18, "%02i", "hou")
HUD.draw_string(25, 12, 18, ":")
HUD.draw_fstring(30, 11, 18, "%02i", "min")
HUD.draw_string(51, 12, 18, ":")
HUD.draw_fstring(56, 11, 18, "%02i", "sec")

-- start/stop
HUD.create_element("jst", 0, 1, 50, 35)
HUD.draw_string(10, 20, 10, "START")
HUD.draw_string(11, 7, 10, "STOP")

-- clr
HUD.create_element("jcr", 50, 1, 30, 35)
HUD.draw_string(4, 14, 10, "CLR")
HUD.end_HUD()

function luatimer() end do_often("luatimer()")
