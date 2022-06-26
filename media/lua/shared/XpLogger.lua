XpLogger = XpLogger or {}

XpLogger.OnAddXp = function(character, perk, amount)
  print('-------------------- XP GAIN --------------------')
  print("Occupation: "..tostring(perk:getName()).." - "..tostring(amount))
end

local function MyAddXp(character, perk, amount)
  print('MyAddXp')
  XpLogger.OnAddXp(character, perk, amount)
end

Events.AddXP.Add(MyAddXp)
