require("Script/Enemy")
require("Script/Bullet")

BiDirectionalSpiralShooter = Enemy:New{}
BiDirectionalSpiralShooter.name = "BiDirectionalSpiralShooter"
BiDirectionalSpiralShooter.shotAngle = {0, 0}
BiDirectionalSpiralShooter.shotAngleRate = {0, 0}
BiDirectionalSpiralShooter.shotSpeed = 0
BiDirectionalSpiralShooter.shotCount = 0
BiDirectionalSpiralShooter.interval = 0
BiDirectionalSpiralShooter.time = 0

function BiDirectionalSpiralShooter:Fire()

    if self.time == 0 then
        for j = 1, 2, 1 do
            for i = 1, self.shotCount, 1 do
                local bullet = Bullet:New{x = self.x, y = self.y, angle = self.shotAngle[j] + math.deg(i / self.shotCount), speed = self.shotSpeed}
                bullet:SetImage(self.bulletImage)
                table.insert(bullets, bullet)
            end

            self.shotAngle[j] = self.shotAngle[j] + self.shotAngleRate[j]
            self.shotAngle[j] = self.shotAngle[j] + self.shotAngleRate[j]
        end
    end

    self.time = (self.time + 1) % self.interval
end
