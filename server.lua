local function vehicleOf(value)
    value = tonumber(value)
    if not value or value == 0 then return nil end
    if DoesEntityExist(value) then return value end
    local fromNet = NetworkGetEntityFromNetworkId(value)
    if fromNet and fromNet ~= 0 and DoesEntityExist(fromNet) then return fromNet end
    return nil
end

local function GetFuel(vehicle)
    vehicle = vehicleOf(vehicle)
    if not vehicle then return 0.0 end
    local level = Entity(vehicle).state.fuel
    if type(level) == 'number' then return level + 0.0 end
    return 0.0
end

local function SetFuel(vehicle, level)
    vehicle = vehicleOf(vehicle)
    level = tonumber(level)
    if not vehicle or not level then return end
    Entity(vehicle).state:set('fuel', math.max(0.0, math.min(100.0, level + 0.0)), true)
end

exports('GetFuel', GetFuel)
exports('SetFuel', SetFuel)
exports('getFuel', GetFuel)
exports('setFuel', SetFuel)
exports('setPaymentMethod', function() end)
