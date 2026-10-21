local FUEL = 'bupa-fuel'

local function valid(vehicle)
    return type(vehicle) == 'number' and vehicle ~= 0 and DoesEntityExist(vehicle)
end

local function GetFuel(vehicle)
    if not valid(vehicle) then return 0.0 end
    if GetResourceState(FUEL) == 'started' then
        local fine, level = pcall(function() return exports[FUEL]:GetFuel(vehicle) end)
        if fine and type(level) == 'number' then return level end
    end
    local level = Entity(vehicle).state.fuel
    if type(level) == 'number' then return level + 0.0 end
    return GetVehicleFuelLevel(vehicle)
end

local function SetFuel(vehicle, level)
    if not valid(vehicle) then return end
    level = tonumber(level)
    if not level then return end
    level = math.max(0.0, math.min(100.0, level + 0.0))
    if GetResourceState(FUEL) == 'started' then
        local fine = pcall(function() exports[FUEL]:SetFuel(vehicle, level) end)
        if fine then return end
    end
    SetVehicleFuelLevel(vehicle, level)
    Entity(vehicle).state:set('fuel', level, NetworkGetEntityIsNetworked(vehicle))
end

exports('GetFuel', GetFuel)
exports('SetFuel', SetFuel)
exports('getFuel', GetFuel)
exports('setFuel', SetFuel)
exports('setMoneyCheck', function() end)
