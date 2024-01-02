local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('azqb-displayid:server:getPlayerServerId', function(source, cb)
    return cb(source)
end)
