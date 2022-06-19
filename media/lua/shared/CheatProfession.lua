CheaterProfession = {}

CheaterProfession.DoProfessions = function()
	local cheater = ProfessionFactory.addProfession("cheater", getText("UI_prof_cheater"), "", 180);

  cheater:addXPBoost(Perks.Aiming, 5)
  cheater:addXPBoost(Perks.Axe, 5)
  cheater:addXPBoost(Perks.Blunt, 5)
  cheater:addXPBoost(Perks.Combat, 5)
  cheater:addXPBoost(Perks.Doctor, 5)
  cheater:addXPBoost(Perks.Lightfoot, 5)
  cheater:addXPBoost(Perks.LongBlade, 5)
  cheater:addXPBoost(Perks.Nimble, 5)
  cheater:addXPBoost(Perks.Reloading, 5)
  cheater:addXPBoost(Perks.SmallBlade, 5)
  cheater:addXPBoost(Perks.SmallBlunt, 5)
  cheater:addXPBoost(Perks.Sneak, 5)
  cheater:addXPBoost(Perks.Spear, 5)
  cheater:addXPBoost(Perks.Sprinting, 5)
end

Events.OnGameBoot.Add(CheaterProfession.DoProfessions);
