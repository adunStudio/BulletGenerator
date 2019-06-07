require("Script/Enemy")
require("Script/Bullet")
require("Script/Function")

RandomCircleShooter = Enemy:New{}
RandomCircleShooter.name = "RandomCircleShooter"
RandomCircleShooter.shotSpeed = 0
RandomCircleShooter.shotCount = 0
RandomCircleShooter.interval = 0
RandomCircleShooter.time = 0

function RandomCircleShooter:Fire()
    if self.time == 0 then
        for i = 1, self.shotCount, 1 do
            local bullet = Bullet:New{x = self.x, y = self.y, angle = math.random(0, 360), angleRate = 0, speed = self.shotSpeed, speedRate = 0}
            bullet:SetImage(IMAGE["bullet"])
            table.insert(bullets, bullet)
        end
    end

    self.time = (self.time + 1) % self.interval
end
