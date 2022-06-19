CheatFitness = {}

CheatFitness.x_NoFatigue = function()
  local bodyParts = getPlayer():getPatient():getBodyDamage():getBodyParts()
  for i=1,bodyParts:size() do
      local bodyPart = bodyParts:get(i-1)
      local bodyPartAction = self.bodyPartAction and self.bodyPartAction[bodyPart]
      if ISHealthPanel.cheat or bodyPart:HasInjury() or bodyPart:bandaged() or bodyPart:stitched() or bodyPart:getSplintFactor() > 0 or bodyPart:getAdditionalPain() > 10 or bodyPart:getStiffness() > 5 then
          table.insert(result, bodyPart)
      end
  end
end

CheatFitness.x_Test_OnTimer = function()
  print("---------- x_Test_OnTimer ----------")
end

CheatFitness.x_Test = function()
  MyTimer:new("Test", nil, CheatFitness.x_Test_OnTimer, 5, 1, nil)
end

CheatFitness.CureBodyPart = function(bodyPart)
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
--  player:getFitness():removeStiffnessValue(BodyPartType.ToString(bodyPart:getType()))
end

CheatFitness.Cure = function()
  local player = getPlayer()
  if player then
    local bodyParts = player:getBodyDamage():getBodyParts()
    if bodyParts then
      for i=1,bodyParts:size() do
        local bodyPart = bodyParts:get(i-1)
        CheatFitness.CureBodyPart(bodyPart)
      end
      print("Cured!")
    end
  end
end

CheatFitness.ResetTemps = function()
  local player = getPlayer()
  if player then
    local thermos = player:getBodyDamage():getThermoregulator()
    if thermos then
      thermos:reset()
    end
  end
end

CheatFitness.x_HelpXpMod = function()
  FitnessExercises.exercisesType.squats.xpMod = 100
  FitnessExercises.exercisesType.pushups.xpMod = 100
  FitnessExercises.exercisesType.situp.xpMod = 100
  FitnessExercises.exercisesType.burpees.xpMod = 100
  FitnessExercises.exercisesType.barbellcurl.xpMod = 100
  FitnessExercises.exercisesType.dumbbellpress.xpMod = 100
  FitnessExercises.exercisesType.bicepscurl.xpMod = 100
end

CheatFitness.elapsed = 0

CheatFitness.OnTimer = function()
  CheatFitness.elapsed = CheatFitness.elapsed + GameTime.getInstance():getRealworldSecondsSinceLastUpdate()
  if (CheatFitness.elapsed > 5) then
    CheatFitness.Cure()
    CheatFitness.ResetTemps()
    CheatFitness.elapsed = 0
  end
end

CheatFitness.Init = function()
  Events.OnTick.Add(CheatFitness.OnTimer);
end

-- Events.OnGameBoot.Add(CheatFitness.Init);

--[[ Samples:

getPlayer():getFitness()
getPlayer():getFitness():getRegularity("squats")


function ISFitnessUI:getCurrentRegularity()
	return (self.player:getFitness():getRegularity(self.selectedExe) / self.regularityProgressBarWidth);
  -- self.selectedExe is something like 'squats'
end

getPlayer():getStats():getFatigue()

local player = getPlayer();
  bodyPart:setStiffness(0)
  player:getFitness():removeStiffnessValue(BodyPartType.ToString(bodyPart:getType()))

playerObj:getInventory():AddItem(itemType)
player:getXp():AddXP(Perks.Farming, xp)
player:getStats():setFatigue(player:getStats():getFatigue() + 0.006)
player:getStats():setEndurance(player:getStats():getEndurance() - 0.0013)
getSpecificPlayer(0)
return character:getPerkLevel(Perks.Farming)
TimedActions.Start(buildMineAction, player, 90, square);

-- look in ISHealthPanelUI.lua for "cheat" and perform it's actions

MyTimer:new("Test", nil, fn)

    if bodyPart:getStiffness() > 5 then
        self:drawText("- " .. getText("IGUI_health_Stiffness"), x, y, 1, 0.58, 0, 1, UIFont.Small);
        y = y + fontHgt;
        if ISHealthPanel.cheat then
            self:drawText("     - exercise fatigue " .. round(bodyPart:getStiffness(),2), x, y, 0.89, 0.28, 0.28, 1, UIFont.Small);
            y = y + fontHgt;
        end
    end

    CheatFitness.Cure()
]]