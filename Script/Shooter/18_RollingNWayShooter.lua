require("Script/Enemy")
require("Script/Bullet")
require("Script/Function")

RollingNWayShooter = Enemy:New{}
RollingNWayShooter.name = "RollingNWayShooter"
RollingNWayShooter.shotAngle = 0
RollingNWayShooter.shotAngleRange = 0
RollingNWayShooter.shotAngleRate = 0
RollingNWayShooter.shotSpeed = 0
RollingNWayShooter.shotCount = 0
RollingNWayShooter.nWayCount = 0
RollingNWayShooter.interval = 0
RollingNWayShooter.time = 0

function RollingNWayShooter:Fire()
    if self.time == 0 then
        for i = 0, self.nWayCount - 1, 1 do
            local newAngle = self.shotAngle + math.deg(i / self.nWayCount)

            ShootNWay(self.x, self.y, newAngle, self.shotAngleRange, self.shotSpeed, self.shotCount, 0, 0)
        end

        self.shotAngle = self.shotAngle + self.shotAngleRate
    end

    self.time = (self.time + 1) % self.interval
end
