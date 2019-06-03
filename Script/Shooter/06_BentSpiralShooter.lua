require("Script/Enemy")
require("Script/Bullet")

BentSpiralShooter = Enemy:New{}
BentSpiralShooter.name = "BentSpiralShooter"
BentSpiralShooter.shotAngle = 0
BentSpiralShooter.shotAngleRate = 0
BentSpiralShooter.shotSpeed = 0
BentSpiralShooter.shotCount = 0
BentSpiralShooter.interval = 0
BentSpiralShooter.time = 0
BentSpiralShooter.bulletAngleRate = 0
BentSpiralShooter.bulletSpeedRate = 0

function BentSpiralShooter:Fire()

    if self.time == 0 then
        for i = 1, self.shotCount, 1 do
            local bullet = Bullet:New{x = self.x, y = self.y, angle = self.shotAngle + math.deg(i / self.shotCount), angleRate = self.bulletAngleRate, speed = self.shotSpeed, speedRate = self.bulletSpeedRate}
            bullet:SetImage(self.bulletImage)
            table.insert(bullets, bullet)
        end

        self.shotAngle = self.shotAngle + self.shotAngleRate
        self.shotAngle = self.shotAngle + self.shotAngleRate
    end

    self.time = (self.time + 1) % self.interval
end
