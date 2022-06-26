UPDATED_ZOMBIE = 'NOT SET'

function OnZombieUpdate(zombie)
  UPDATED_ZOMBIE = zombie
  -- zombie:Wander()
end

Events.OnZombieUpdate.Add(OnZombieUpdate)
