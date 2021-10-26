--------------------------------------------------------------
--sSync Created by Supman138; Code used from Vespura's vSync--
-----------DO NOT REPOST OR CLAIM THIS WORK AS YOURS----------
--------------------------------------------------------------


------------------ change this -------------------
DynamicWeather = true -- Set this to false if you don't want the weather to change automatically every 10 minutes.
updateAvailableNotification = true -- Get available update notification 




--------------------------------------------------------------
debugprint = false -- Debug mode: Not recommended unless asked
--------------------------------------------------------------







--WARNING -- TOUCHING THE LINES BELOW ARE SCRIPT BREAKING -- DO NOT TOUCH --
AvailableWeatherTypes = {
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS', 
    'CLEARING', 
    'RAIN', 
    'THUNDER', 
    'SNOW', 
    'BLIZZARD', 
    'SNOWLIGHT', 
    'XMAS', 
    'HALLOWEEN',
}
CurrentWeather = "EXTRASUNNY"
local baseTime = 0
local timeOffset = 0
local freezeTime = false
local blackout = false
local newWeatherTimer = 10

RegisterServerEvent('sSync:requestSync')
AddEventHandler('sSync:requestSync', function()
    TriggerClientEvent('sSync:updateWeather', -1, CurrentWeather, blackout)
    TriggerClientEvent('sSync:updateTime', -1, baseTime, timeOffset, freezeTime)
end)

RegisterCommand('freezetime', function(source, args)
    if source ~= 0 then
        if IsPlayerAceAllowed(source, "sSync.Time") then
            freezeTime = not freezeTime
            if freezeTime then
                TriggerClientEvent('sSync:notify', source, 'Time is now ~b~frozen~s~.')
            else
                TriggerClientEvent('sSync:notify', source, 'Time is ~y~no longer frozen~s~.')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You are not allowed to use this command.')
        end
    else
        freezeTime = not freezeTime
        if freezeTime then
            print("Time is now frozen.")
        else
            print("Time is no longer frozen.")
        end
    end
end)

RegisterCommand('freezeweather', function(source, args)
    if source ~= 0 then
        if IsPlayerAceAllowed(source, "sSync.Weather") then
            DynamicWeather = not DynamicWeather
            if not DynamicWeather then
                TriggerClientEvent('sSync:notify', source, 'Dynamic weather changes are now ~r~disabled~s~.')
            else
                TriggerClientEvent('sSync:notify', source, 'Dynamic weather changes are now ~b~enabled~s~.')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You are not allowed to use this command.')
        end
    else
        DynamicWeather = not DynamicWeather
        if not DynamicWeather then
            print("Weather is now frozen.")
        else
            print("Weather is no longer frozen.")
        end
    end
end)

RegisterCommand('weather', function(source, args)
    if source == 0 then
        local validWeatherType = false
        if args[1] == nil then
            print("Invalid syntax, correct syntax is: /weather <weathertype> ")
            return
        else
            for i,wtype in ipairs(AvailableWeatherTypes) do
                if wtype == string.upper(args[1]) then
                    validWeatherType = true
                end
            end
            if validWeatherType then
                print("Weather has been updated.")
                CurrentWeather = string.upper(args[1])
                newWeatherTimer = 10
                TriggerEvent('sSync:requestSync')
            else
                print("Invalid weather type, valid weather types are: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ")
            end
        end
    else
        if IsPlayerAceAllowed(source, "sSync.Weather") then
            local validWeatherType = false
            if args[1] == nil then
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid syntax, use ^0/weather <weatherType> ^1instead!')
            else
                for i,wtype in ipairs(AvailableWeatherTypes) do
                    if wtype == string.upper(args[1]) then
                        validWeatherType = true
                    end
                end
                if validWeatherType then
                    TriggerClientEvent('sSync:notify', source, 'Weather will change to: ~y~' .. string.lower(args[1]) .. "~s~.")
                    CurrentWeather = string.upper(args[1])
                    newWeatherTimer = 10
                    TriggerEvent('sSync:requestSync')
                else
                    TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid weather type, valid weather types are: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ')
                end
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You do not have access to that command.')
        end
    end
end, false)

RegisterCommand('blackout', function(source)
    if source == 0 then
        blackout = not blackout
        if blackout then
            print("Blackout is now enabled.")
        else
            print("Blackout is now disabled.")
        end
    else
        if IsPlayerAceAllowed(source, "sSync.Weather") then
            blackout = not blackout
            if blackout then
                TriggerClientEvent('sSync:notify', source, 'Blackout is now ~b~enabled~s~.')
            else
                TriggerClientEvent('sSync:notify', source, 'Blackout is now ~r~disabled~s~.')
            end
            TriggerEvent('sSync:requestSync')
        end
    end
end)

RegisterCommand('morning', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if IsPlayerAceAllowed(source, "sSync.Time") then
        ShiftToMinute(0)
        ShiftToHour(9)
        TriggerClientEvent('sSync:notify', source, 'Time set to ~y~morning~s~.')
        TriggerEvent('sSync:requestSync')
    end
end)
RegisterCommand('noon', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if IsPlayerAceAllowed(source, "sSync.Time") then
        ShiftToMinute(0)
        ShiftToHour(12)
        TriggerClientEvent('sSync:notify', source, 'Time set to ~y~noon~s~.')
        TriggerEvent('sSync:requestSync')
    end
end)
RegisterCommand('evening', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if IsPlayerAceAllowed(source, "sSync.Time") then
        ShiftToMinute(0)
        ShiftToHour(18)
        TriggerClientEvent('sSync:notify', source, 'Time set to ~y~evening~s~.')
        TriggerEvent('sSync:requestSync')
    end
end)
RegisterCommand('night', function(source)
    if source == 0 then
        print("For console, use the \"/time <hh> <mm>\" command instead!")
        return
    end
    if IsPlayerAceAllowed(source, "sSync.Time") then
        ShiftToMinute(0)
        ShiftToHour(23)
        TriggerClientEvent('sSync:notify', source, 'Time set to ~y~night~s~.')
        TriggerEvent('sSync:requestSync')
    end
end)

function ShiftToMinute(minute)
    timeOffset = timeOffset - ( ( (baseTime+timeOffset) % 60 ) - minute )
end

function ShiftToHour(hour)
    timeOffset = timeOffset - ( ( ((baseTime+timeOffset)/60) % 24 ) - hour ) * 60
end

RegisterCommand('time', function(source, args, rawCommand)
    if source == 0 then
        if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
            local argh = tonumber(args[1])
            local argm = tonumber(args[2])
            if argh < 24 then
                ShiftToHour(argh)
            else
                ShiftToHour(0)
            end
            if argm < 60 then
                ShiftToMinute(argm)
            else
                ShiftToMinute(0)
            end
            print("Time has changed to " .. argh .. ":" .. argm .. ".")
            TriggerEvent('sSync:requestSync')
        else
            print("Invalid syntax, correct syntax is: time <hour> <minute> !")
        end
    elseif source ~= 0 then
       if IsPlayerAceAllowed(source, "sSync.Time") then
            if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
                local argh = tonumber(args[1])
                local argm = tonumber(args[2])
                if argh < 24 then
                    ShiftToHour(argh)
                else
                    ShiftToHour(0)
                end
                if argm < 60 then
                    ShiftToMinute(argm)
                else
                    ShiftToMinute(0)
                end
                local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
				local minute = math.floor((baseTime+timeOffset)%60)
                if minute < 10 then
                    newtime = newtime .. "0" .. minute
                else
                    newtime = newtime .. minute
                end
                TriggerClientEvent('sSync:notify', source, 'Time was changed to: ~y~' .. newtime .. "~s~!")
                TriggerEvent('sSync:requestSync')
            else
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid syntax. Use ^0/time <hour> <minute> ^1instead!')
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You do not have access to that command.')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local newBaseTime = os.time(os.date("!*t"))/2 + 360
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime			
        end
        baseTime = newBaseTime
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        TriggerClientEvent('sSync:updateTime', -1, baseTime, timeOffset, freezeTime)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)
        TriggerClientEvent('sSync:updateWeather', -1, CurrentWeather, blackout)
    end
end)

Citizen.CreateThread(function()
    while true do
        newWeatherTimer = newWeatherTimer - 1
        Citizen.Wait(60000)
        if newWeatherTimer == 0 then
            if DynamicWeather then
                NextWeatherStage()
            end
            newWeatherTimer = 10
        end
    end
end)

function NextWeatherStage()
    if CurrentWeather == "CLEAR" or CurrentWeather == "CLOUDS" or CurrentWeather == "EXTRASUNNY"  then
        local new = math.random(1,2)
        if new == 1 then
            CurrentWeather = "CLEARING"
        else
            CurrentWeather = "OVERCAST"
        end
    elseif CurrentWeather == "CLEARING" or CurrentWeather == "OVERCAST" then
        local new = math.random(1,6)
        if new == 1 then
            if CurrentWeather == "CLEARING" then CurrentWeather = "FOGGY" else CurrentWeather = "RAIN" end
        elseif new == 2 then
            CurrentWeather = "CLOUDS"
        elseif new == 3 then
            CurrentWeather = "CLEAR"
        elseif new == 4 then
            CurrentWeather = "EXTRASUNNY"
        elseif new == 5 then
            CurrentWeather = "SMOG"
        else
            CurrentWeather = "FOGGY"
        end
    elseif CurrentWeather == "THUNDER" or CurrentWeather == "RAIN" then
        CurrentWeather = "CLEARING"
    elseif CurrentWeather == "SMOG" or CurrentWeather == "FOGGY" then
        CurrentWeather = "CLEAR"
    end
    TriggerEvent("sSync:requestSync")
    if debugprint then
        print("[sSync] New random weather type has been generated: " .. CurrentWeather .. ".\n")
        print("[sSync] Resetting timer to 10 minutes.\n")
    end
end

--Outdated Version Notification--
Citizen.CreateThread( function()
    Citizen.Wait(5000)
    print([[^1-------------------------------------------------------^5
    ||           _____                 
    ||     _____/ ___/__  ______  _____
    ||    / ___/\__ \/ / / / __ \/ ___/
    ||   (__  )___/ / /_/ / / / / /__  
    ||  /____//____/\__, /_/ /_/\___/  
    ||             /____/              
    ||    
    ||    Created by Supman138
    ||    Code used from Vespura's vSync
    ||    sSync has been started
^1-------------------------------------------------------^0]])			
    SetConvarServerInfo("sSync", "V"..GetResourceMetadata(GetCurrentResourceName(), 'version'))
    if GetResourceMetadata(GetCurrentResourceName(), 'version') then
        PerformHttpRequest(
            'https://raw.githubusercontent.com/Supman138/sSync/master/version.json',
            function(code, res, headers)
                if code == 200 then
                    local rv = json.decode(res)
                    if rv.version ~= GetResourceMetadata(GetCurrentResourceName(), 'version') then
                        print(
                            ([[^1
    ||    sSync
    ||    UPDATE: %s AVAILABLE
    ||    CHANGELOG: %s
-------------------------------------------------------^0]]):format(
                                rv.version,
                                rv.changelog
                            )
                        )
                    end
                else
                    print('sSync unable to check version')
                end
            end,
            'GET'
        )
    end
end
)