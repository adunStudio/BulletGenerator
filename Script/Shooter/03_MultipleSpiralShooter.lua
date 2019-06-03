require("Script/Enemy")
require("Script/Bullet")

MultipleSpiralShooter = Enemy:New{}
MultipleSpiralShooter.name = "MultipleSpiralShooter"
MultipleSpiralShooter.shotAngle = 0
MultipleSpiralShooter.shotAngleRate = 0
MultipleSpiralShooter.shotSpeed = 0
MultipleSpiralShooter.shotCount = 0

function MultipleSpiralShooter:Fire()

    for i = 0, self.shotCount-1, 1 do
        local bullet = Bullet:New{x = self.x, y = self.y, angle = self.shotAngle + math.deg(i / self.shotCount), speed = self.shotSpeed}
        bullet:SetImage(self.bulletImage)

        table.insert(bullets, bullet)
    end

    self.shotAngle = self.shotAngle + self.shotAngleRate
end
