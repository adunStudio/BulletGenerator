require("Script/Enemy")
require("Script/Bullet")
require("Script/Function")

RandomNWayShooter = Enemy:New{}
RandomNWayShooter.name = "RandomNWayShooter"
RandomNWayShooter.shotAngle = 0
RandomNWayShooter.shotAngleRange = 0
RandomNWayShooter.shotSpeed = 0
RandomNWayShooter.shotCount = 0
RandomNWayShooter.interval = 0
RandomNWayShooter.time = 0

function RandomNWayShooter:Fire()
    if self.time == 0 then
        for i = 1, self.shotCount, 1 do
            local bullet = Bullet:New{x = self.x, y = self.y, angle = self.shotAngle + self.shotAngleRange * (math.random(0, 100) / 100 - 0.5), angleRate = 0, speed = self.shotSpeed, speedRate = 0}
            bullet:SetImage(IMAGE["bullet"])
            table.insert(bullets, bullet)
        end
    end

    self.time = (self.time + 1) % self.interval
end
