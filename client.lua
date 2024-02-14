RegisterNUICallback("init", function()
    SendNUIMessage({
        type = "updateAppendText",
        text = "ID: " .. tostring(GetPlayerServerId(PlayerId()))
    })
end)
