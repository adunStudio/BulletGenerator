require("Script/Enemy")
require("Script/Bullet")
require("Script/Function")

IntermittentAimingNWayShooter = Enemy:New{}
IntermittentAimingNWayShooter.name = "IntermittentAimingNWayShooter"
IntermittentAimingNWayShooter.shotAngleRange = 0
IntermittentAimingNWayShooter.shotSpeed = 0
IntermittentAimingNWayShooter.shotCount = 0
IntermittentAimingNWayShooter.interval = 0
IntermittentAimingNWayShooter.shotTime = 0
IntermittentAimingNWayShooter.waitTime = 0
IntermittentAimingNWayShooter.time = 0

function IntermittentAimingNWayShooter:Fire(_x, _y)

    if (self.time < self.shotTime) and (self.time % self.interval == 0) then
        local newAngle = GetAngle(self.x, self.y, _x, _y)

        ShootNWay(self.x, self.y, newAngle, self.shotAngleRange, self.shotSpeed, self.shotCount, 0, 0)
    end

    self.time = (self.time + 1) % (self.shotTime + self.waitTime)
end
