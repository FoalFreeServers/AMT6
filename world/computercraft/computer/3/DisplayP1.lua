R1 = peripheral.find("fissionReactorLogicAdapter")
R2 = peripheral.find("fissionReactorPort")
T1 = peripheral.find("turbineValve")
assert(R1,"Reactor Logic Missing")    
assert(R2,"Reactor Port Missing")
assert(R1.isFormed(),"Reactor Structure Incomplete")
 
local monitor = peripheral.wrap("top") 
term.redirect(monitor)      
                       
function KtC(TempinK) 
    return TempinK - 273.15
end

function EUtFE(EUPower) --in kFE
    return EUPower * 4 * 0.0001
end

--function Nominality()
--    if not R1.getStatus()
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
--   end
--end
    
while R1.isFormed() do
    
    local ROnOff
    local RFunction = "FunctionX"
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
    
    local Production = EUtFE(T1.getProductionRate())
    local MaxProduction = T1.getMaxProduction()
    
   -- Nominality()
   
    if not Status
        then ROnOff = "Reactor Idle"
    else ROnOff = "Reactor Working"
    end
   
    if not Status
        then RFunction = "Offline"
    elseif (KtC(Temp)) > 290
        then RFunction = "Warning: Overheating"
    elseif (CoolSod < 0.05)
        then RFunction = "Warning: Low Coolant"
    elseif (HotSod > 0.5)
        then RFunction = "Warning: Coolant Blockage"
    elseif (Damage > 0)
        then RFunction = "Warning: Integrity Compromised"
    elseif (Waste > 0.5)
        then RFunction = "Warning: Waste Blockage"
    elseif (Fuel < 0.1)
        then RFunction = "Warning: Fuel Low"
    else RFunction = "All Systems Nominal"
    end

term.clear()
term.setCursorPos(1,1)
    
term.setTextColor(colors.orange)
print("Monitoring Reactor... "..RFunction) 
term.setTextColor(colors.lightGray)    
print("-----------------------------------------")
term.setTextColor(colors.white)
term.write("Status      : ") print(ROnOff)
print("Temperature : "..math.floor(KtC(Temp)).."C")
print("Fuel Level  : "..math.floor(Fuel*100).."%")
print("Burn Rate   : "..Burn.."mB/t")
print("Processing  : "..ActBurn.."/"..MaxBurn.."mB/t")
term.setTextColor(colors.lightGray)
print("-----------------------------------------")
term.setTextColor(colors.white)
print("Hot Coolant in Vessel    : "..(math.floor(HotSod*100*22.5)*0.01).."kB")
print("Coolant Supply in Vessel : "..(math.floor(CoolSod*100*22.5)*0.01).."/22.5kB")
term.setTextColor(colors.lightGray)
print("-----------------------------------------")
term.setTextColor(colors.white)
term.setCursorPos(1,13)

print("Turbine Production Rate  : "..(math.floor(Production*100)*0.01).."kFE/t")

term.setCursorPos(1,15)
term.setTextColor(colors.lightGray)
print("-----------------------------------------")
term.setTextColor(colors.white)

sleep(0.25)

end