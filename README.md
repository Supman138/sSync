# sSync
### **Simple Time and Weather Sync script**
**Current Version:** 1.0.0  
**Author:** Supman138  
**Last Update:** 10-25-2021  
**Orignally Created By** Vespura ([vSync](https://forum.cfx.re/t/vsync-v1-4-0-simple-weather-and-time-sync/49710))  
***DISCLAIMER: FULL PERMISSION WAS GRANTED FROM VESPURA TO RE-RELEASE [vSync](https://forum.cfx.re/t/vsync-v1-4-0-simple-weather-and-time-sync/49710), RENAME [vSync](https://forum.cfx.re/t/vsync-v1-4-0-simple-weather-and-time-sync/49710), AND GIVE MYSELF CREDITS TO THE WORK I HAVE DONE WHILST GIVING CREDIT TO VESPURA AND [vSync](https://forum.cfx.re/t/vsync-v1-4-0-simple-weather-and-time-sync/49710)***
#

# Features
- Dynamic changing weather every 10 minutes (can be (temporarily or permanently) disabled. The weather will only change according to realistic patterns. Some types like snow, xmas, halloween and neutral have been disabled. This means that if the weather is currenlty one of those types, it won't be changed. It will also never change to those types.
- Blackout. Enable/disable this in the config or using /blackout ingame.
- Weather and Time synced across all players.
- Custom permissions for the commands using Ace Permissions.

# Ace Permissions
#### **Replace GROUPNAME with your ace group [ex. add_ace group.admin sSync.Time]**
add_ace group.GROUPNAME sSync.Time allow
add_ace group.GROUPNAME sSync.Weather allow

# Commands
``/weather <type>`` - Change the weather type (will fade to the new weather type within 15 seconds).  
``/freezeweather`` - Enable/disable dynamic weather changes.  
``/time <h> <m>`` - Set the time.  
``/freezetime`` - Freeze/unfreeze time.  
``/morning`` - Set the time to morning.  
``/noon`` - Set the time to noon.  
``/evening`` - Set the time to evening.  
``/night`` - Set the time to night.  
``/blackout`` - Enable/disable blackout mode.

# Credits

**Supman138** - Releasing sSync; Adding Ace Permissions; Updating ``__resource.lua`` --> ``fxmanifest.lua``
  - **Website:** https://supman138.com  
  - **Discord:** https://supman138.com/discord  

**Vespura** - Creator of the base of the script; created [vSync](https://forum.cfx.re/t/vsync-v1-4-0-simple-weather-and-time-sync/49710); Special thanks to Vespura for allowing me to re-release his script with my updates that I have put into it.
  - **Website:** https://vespura.com/
  - **Discord:** https://vespura.com/discord -- Vespura will not provide support for this release, do not join his server requesting for support
