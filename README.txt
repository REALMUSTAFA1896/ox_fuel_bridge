ox_fuel bridge for BUPA Fuel

Lets scripts written for ox_fuel work with BUPA Fuel. There is no real ox_fuel here:
every call is passed to bupa-fuel.

Install
1. Remove or stop the original ox_fuel.
2. Put this ox_fuel folder in your resources.
3. In server.cfg start it after bupa-fuel:
       ensure bupa-fuel
       ensure ox_fuel

What it covers
- GetResourceState('ox_fuel') reports started, so scripts pick ox_fuel.
- Entity(vehicle).state.fuel works both ways; BUPA Fuel uses the same state bag.
- exports.ox_fuel:GetFuel / SetFuel (client and server) go to BUPA Fuel.
- exports.ox_fuel:setMoneyCheck and setPaymentMethod are accepted; BUPA Fuel handles payment.
