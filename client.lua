CreateThread(function()
    SendNUIMessage({
        type = "updateAppendText",
        text = "ID: " .. tostring(GetPlayerServerId(PlayerId()))
    })
end)
