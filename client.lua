local QBCore = exports['qb-core']:GetCoreObject()
local serverId = nil

local DrawTitle = function(text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.30, 0.30)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextRightJustify(true)
    SetTextWrap(0,1.0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.5, 0.0)
end

QBCore.Functions.TriggerCallback('azqb-displayid:server:getPlayerServerId', function(source)
    serverId = source
end)

CreateThread(function()
    while true do
        DrawTitle("PlayerID: " .. tostring(serverId))
        Wait(0)
    end
end)