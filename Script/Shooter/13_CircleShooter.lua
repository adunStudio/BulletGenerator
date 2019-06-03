require("Script/Enemy")
require("Script/Bullet")

CircleShooter = Enemy:New{}
CircleShooter.name = "CircleShooter"
CircleShooter.shotAngle = 0
CircleShooter.shotSpeed = 0
CircleShooter.shotCount = 0
CircleShooter.interval = 0
CircleShooter.time = 0
CircleShooter.bulletAngleRate = 0
CircleShooter.bulletSpeedRate = 0

function CircleShooter:Fire()
    if self.time == 0 then
        ShootNWay(self.x, self.y, self.shotAngle, 360 - (360 / (self.shotCount-1)), self.shotSpeed, self.shotCount, self.bulletAngleRate, self.bulletSpeedRate)
    end

    self.time = (self.time + 1) % self.interval
end
