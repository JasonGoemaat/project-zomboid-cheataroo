CheatHealth = CheatHealth or { Initialized = false, Updates = 0, Counter = 0 }

function CheatHealth_CureBodyPart(bodyPart)
  bodyPart:setBleedingTime(0)
  bodyPart:SetBitten(false)
  bodyPart:SetInfected(false)
  bodyPart:SetFakeInfected(false)
  bodyPart:setHaveBullet(false, 0)
  bodyPart:setDeepWoundTime(0)
  bodyPart:setDeepWounded(false)
  bodyPart:setBurnTime(0)
  bodyPart:setFractureTime(0)
  bodyPart:RestoreToFullHealth();
  bodyPart:setWoundInfectionLevel(-1)
  bodyPart:setScratched(false, true)
  bodyPart:setScratchTime(0)
  bodyPart:setCut(false)
  bodyPart:setCutTime(0)
  bodyPart:setStiffness(0)
end

function CheatHealth_OnPlayerUpdate(player)
  -- About 60 FPS, just do something once a frame
  CheatHealth.Counter = (CheatHealth.Counter or 0) + 1
  if (CheatHealth.Counter < 60) then return end
  CheatHealth.Counter = 0

  CheatHealth.Updates = CheatHealth.Updates + 1
  
  -- fix any problems with body parts
  local bodyParts = player:getBodyDamage():getBodyParts()
  for i=1,bodyParts:size() do
    local bodyPart = bodyParts:get(i-1)
    CheatHealth_CureBodyPart(bodyPart)
  end

  -- reset thermo regulator
  player:getBodyDamage():getThermoregulator():reset()
end

if not CheatHealth.Initialized then
  CheatHealth.Initialized = true
  Events.OnPlayerUpdate.Add(CheatHealth_OnPlayerUpdate)
end
