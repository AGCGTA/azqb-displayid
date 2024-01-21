local QBCore = exports['qb-core']:GetCoreObject()
local serverId = nil
local mon = 0
local day = 0
local hour = 0
local min = 0
local sec = 0

local DrawTitle = function(text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.30, 0.30)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.005, 0.005)
end

local function CheckServerTime()
    QBCore.Functions.TriggerCallback('azqb-displayid:server:getTime', function(rmon, rday, rhour, rmin, rsec)
        mon = rmon
        day = rday
        hour = rhour
        min = rmin
        sec = rsec
    end)
    SetTimeout(10 * 1000, CheckServerTime)
end

local function ClockupTime()
    sec = sec + 1
    if sec == 60 then
        sec = 0
        min = 1
    end
    if min == 60 then
        hour = hour + 1
        min = 0
    end
    if hour == 24 then
        hour = 0
        day = day + 1
    end
    SetTimeout(1 * 1000, ClockupTime)
end

CreateThread(function()
    QBCore.Functions.TriggerCallback('azqb-displayid:server:getPlayerServerId', function(source)
        serverId = source
    end)
    CheckServerTime()
    ClockupTime()
    while true do
        DrawTitle(string.format("%02d/%02d %02d:%02d:%02d", mon, day, hour, min, sec) .. " | " .. "ID: " .. tostring(serverId))
        Wait(0)
    end
end)
