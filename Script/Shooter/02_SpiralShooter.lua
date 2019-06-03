require("Script/Enemy")
require("Script/Bullet")

SpiralShooter = Enemy:New{}
SpiralShooter.name = "SpiralShooter"
SpiralShooter.shotAngle = 0
SpiralShooter.shotAngleRate = 0
SpiralShooter.shotSpeed = 0

function SpiralShooter:Fire()
    local bullet = Bullet:New{x = self.x, y = self.y, angle = self.shotAngle, speed = self.shotSpeed}
    bullet:SetImage(self.bulletImage)

    self.shotAngle = self.shotAngle + self.shotAngleRate

    table.insert(bullets, bullet)
end
