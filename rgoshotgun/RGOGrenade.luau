--!strict

local partitions = require("./partitions")

local ModTable_ = {}
ModTable_.__index = ModTable_
local ModTable = ModTable_

function ModTable:on_load(
   grenadefile: SoldierWeaponBlueprint
)
   local grenadeconfig = grenadefile.object :: SoldierWeaponData

   grenadeconfig.weaponFiring.primaryFire.weaponDispersion.standDispersion.minAngle = 1.5
   grenadeconfig.weaponFiring.primaryFire.weaponDispersion.standDispersion.maxAngle = 1.5
   grenadeconfig.weaponFiring.primaryFire.weaponDispersion.crouchDispersion.minAngle = 0.3
   grenadeconfig.weaponFiring.primaryFire.weaponDispersion.crouchDispersion.maxAngle = 0.3

   grenadeconfig.weaponFiring.primaryFire.shot.initialDirection.z = 50
   grenadeconfig.weaponFiring.primaryFire.shot.numberOfBulletsPerShell = 8

   grenadeconfig.weaponFiring.primaryFire.ammo.numberOfMagazines = 2
   grenadeconfig.weaponFiring.primaryFire.ammo.magazineCapacity = 1
   grenadeconfig.weaponFiring.primaryFire.ammo.autoReplenishDelay = 5
   grenadeconfig.weaponFiring.primaryFire.ammo.autoReplenishMagazine = true

end

partitions.onAllInstancesLoaded(ModTable, ModTable.on_load,{
   partition = Guid("C15B24EC-311C-456E-9300-779EF33F6708"),
   instance = Guid("39FB77D9-D9EA-4652-80A2-6F7EC52DE270"),
})

return nil