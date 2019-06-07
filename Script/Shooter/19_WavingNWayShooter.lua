require("Script/Enemy")
require("Script/Bullet")
require("Script/Function")

WavingNWayShooter = Enemy:New{}
WavingNWayShooter.name = "WavingNWayShooter"
WavingNWayShooter.shotAngle = 0
WavingNWayShooter.shotAngleRange = 0
WavingNWayShooter.wavingAngleRange = 0
WavingNWayShooter.shotSpeed = 0
WavingNWayShooter.shotCount = 0
WavingNWayShooter.cycle = 0
WavingNWayShooter.time = 0

function WavingNWayShooter:Fire()
    if (self.time % self.interval) == 0 then
        local newAngle = self.shotAngle + self.wavingAngleRange * math.sin(math.pi * 2 * self.time / self.cycle)

        ShootNWay(self.x, self.y, newAngle, self.shotAngleRange, self.shotSpeed, self.shotCount, 0, 0)
    end

    self.time = (self.time + 1) % self.cycle
end
