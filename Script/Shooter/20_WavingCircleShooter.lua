require("Script/Enemy")
require("Script/Bullet")
require("Script/Function")

WavingCircleShooter = Enemy:New{}
WavingCircleShooter.name = "WavingCircleShooter"
WavingCircleShooter.shotAngle = 0
WavingCircleShooter.shotAngleRange = 0
WavingCircleShooter.wavingAngleRange = 0
WavingCircleShooter.shotSpeed = 0
WavingCircleShooter.shotCount = 0
WavingCircleShooter.cycle = 0
WavingCircleShooter.time = 0

function WavingCircleShooter:Fire()
    self.shotAngleRange = 360 - 360 / self.shotCount

    if (self.time % self.interval) == 0 then
        local newAngle = self.shotAngle + self.wavingAngleRange * math.sin(math.pi * 2 * self.time / self.cycle)

        ShootNWay(self.x, self.y, newAngle, self.shotAngleRange, self.shotSpeed, self.shotCount, 0, 0)
    end

    self.time = (self.time + 1) % self.cycle
end
