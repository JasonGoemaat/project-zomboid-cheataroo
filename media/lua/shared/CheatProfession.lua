CheaterProfession = {}

CheaterProfession.DoProfessions = function()
	--local cheater = ProfessionFactory.addProfession("cheater", getText("UI_prof_cheater"), getTexture("media/ui/profession_cheater.png"), 200);
	local cheater = ProfessionFactory.addProfession("cheater", getText("UI_prof_cheater"), "profession_cheater", 200);
	--local cheater = ProfessionFactory.addProfession("cheater", getText("UI_prof_cheater"), "profession_fireofficer2", 200);

  cheater:addXPBoost(Perks.Agility, 10)
  cheater:addXPBoost(Perks.Aiming, 10)
  cheater:addXPBoost(Perks.Axe, 10)
  cheater:addXPBoost(Perks.Blacksmith, 10)
  cheater:addXPBoost(Perks.Blunt, 10)
  cheater:addXPBoost(Perks.Combat, 10)
  cheater:addXPBoost(Perks.Cooking, 10)
  cheater:addXPBoost(Perks.Crafting, 10)
  cheater:addXPBoost(Perks.Doctor, 10)
  cheater:addXPBoost(Perks.Electricity, 10);
  cheater:addXPBoost(Perks.Farming, 10)
  cheater:addXPBoost(Perks.Firearm, 10)
  cheater:addXPBoost(Perks.Fishing, 10)
  cheater:addXPBoost(Perks.Fitness, 10)
  cheater:addXPBoost(Perks.Lightfoot, 10)
  cheater:addXPBoost(Perks.LongBlade, 10)
  cheater:addXPBoost(Perks.Maintenance, 10)
  cheater:addXPBoost(Perks.Mechanics, 10)
  cheater:addXPBoost(Perks.Melting, 10)
  cheater:addXPBoost(Perks.MetalWelding, 10)
  cheater:addXPBoost(Perks.Nimble, 10)
  cheater:addXPBoost(Perks.PlantScavenging, 10)
  cheater:addXPBoost(Perks.Reloading, 10)
  cheater:addXPBoost(Perks.SmallBlade, 10)
  cheater:addXPBoost(Perks.SmallBlunt, 10)
  cheater:addXPBoost(Perks.Sneak, 10)
  cheater:addXPBoost(Perks.Spear, 10)
  cheater:addXPBoost(Perks.Sprinting, 10)
  cheater:addXPBoost(Perks.Strength, 10)
  cheater:addXPBoost(Perks.Survivalist, 10)
  cheater:addXPBoost(Perks.Tailoring, 10)
  cheater:addXPBoost(Perks.Trapping, 10)
  cheater:addXPBoost(Perks.Woodwork, 10)
end

Events.OnGameBoot.Add(CheaterProfession.DoProfessions);
