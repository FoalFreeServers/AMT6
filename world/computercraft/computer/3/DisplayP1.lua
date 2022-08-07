R1 = peripheral.find("fissionReactorLogicAdapter")
R2 = peripheral.find("fissionReactorPort")
assert(R1,"Reactor Logic Missing")    
assert(R2,"Reactor Port Missing")
assert(R1.isFormed(),"Reactor Structure Incomplete")

function KtC(TempinK) 
   return TempinK - 273.15
end

--function Nominality()
--    if R1.getStatus()
--        then RFunction = "Offline"
--    elseif (KtC(Temp)) > 290
--        then RFunction = "System Malfunction"
--    elseif (CoolSod < 0.05)
--        then RFunction = "System Malfunction"
--    elseif (HotSod < 0.5)
--        then RFunction = "System Malfunction"
--    elseif (Damage > 0)
--        then RFunction = "System Malfunction"
--    elseif (Waste > 0.5)
--        then RFunction = "System Malfunction"
--    else RFunction = "All Systems Nominal"
--    end
   -- else RFunction = "Offline"
   -- end
--end
    
while R1.isFormed() do

    local RFunction = "All Systems Nominal"
    local Temp = R1.getTemperature()
    local Status = R1.getStatus()
    local Fuel = R1.getFuelFilledPercentage()
    local CoolSod = R1.getCoolantFilledPercentage()
    local HotSod = R1.getHeatedCoolantFilledPercentage()
    local Damage = R1.getDamagePercent()
    local Waste = R1.getWasteFilledPercentage()
    local Burn = R1.getBurnRate()
    local MaxBurn = R1.getMaxBurnRate()
    local ActBurn = R1.getActualBurnRate()
    
term.clear()
term.setCursorPos(1,1)
print(Status)

   -- if Status = "false" then RFunction = "Offline"
   -- end
    
print("Monitoring Reactor..."..RFunction)     
print("------------------------------------")
--print("Status:"..(Status))
print("Temperature : "..math.floor(KtC(Temp)).."C")
print("Fuel Level  : "..math.floor(Fuel*100).."%")
print("Processing  : "..ActBurn.."/"..MaxBurn.."mB/t")
print("------------------------------------")
print("Hot Coolant in Vessel:"..HotSod)
print("Coolant Supply in Vessel:"..(math.floor(CoolSod*100*22.5)*0.01).."/22.5kB")
sleep(0.25)
end
