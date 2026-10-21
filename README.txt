ox_fuel_bridge for BUPA Fuel

Lets scripts written for ox_fuel work with BUPA Fuel. There is no real ox_fuel here:
the resource provides the name ox_fuel and passes every call to bupa-fuel.

Install
1. Remove or stop the original ox_fuel. Both cannot run together.
2. Put the ox_fuel_bridge folder in your resources.
3. In server.cfg start it after bupa-fuel:
       ensure bupa-fuel
       ensure ox_fuel_bridge

What it covers
- The manifest has provide 'ox_fuel', so scripts that look for ox_fuel or call
  exports.ox_fuel reach this bridge.
- Entity(vehicle).state.fuel works both ways; BUPA Fuel uses the same state bag.
- exports.ox_fuel:GetFuel / SetFuel (client and server) go to BUPA Fuel.
- exports.ox_fuel:setMoneyCheck and setPaymentMethod are accepted; BUPA Fuel handles payment.
