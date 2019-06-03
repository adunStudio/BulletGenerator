require("Script/Enemy")
require("Script/Bullet")

NWayShooter = Enemy:New{}
NWayShooter.name = "NWayShooter"
NWayShooter.shotAngle = 0
NWayShooter.shotAngleRange = 0
NWayShooter.shotSpeed = 0
NWayShooter.shotCount = 0
NWayShooter.interval = 0
NWayShooter.time = 0
NWayShooter.bulletAngleRate = 0
NWayShooter.bulletSpeedRate = 0

function NWayShooter:Fire()
    if self.time == 0 then
        ShootNWay(self.x, self.y, self.shotAngle, self.shotAngleRange, self.shotSpeed, self.shotCount, self.bulletAngleRate, self.bulletSpeedRate)
    end

    self.time = (self.time + 1) % self.interval
end
