require("Script/Enemy")
require("Script/Bullet")
require("Script/Function")

AimingNWayShooter = Enemy:New{}
AimingNWayShooter.name = "AimingNWayShooter"
AimingNWayShooter.shotAngleRange = 0
AimingNWayShooter.shotSpeed = 0
AimingNWayShooter.shotCount = 0
AimingNWayShooter.interval = 0
AimingNWayShooter.time = 0
AimingNWayShooter.bulletAngleRate = 0
AimingNWayShooter.bulletSpeedRate = 0

function AimingNWayShooter:Fire(_x, _y)

    if self.time == 0 then
        local newAngle = GetAngle(self.x, self.y, _x, _y)

        ShootNWay(self.x, self.y, newAngle, self.shotAngleRange, self.shotSpeed, self.shotCount, self.bulletAngleRate, self.bulletSpeedRate)
    end

    self.time = (self.time + 1) % self.interval
end
