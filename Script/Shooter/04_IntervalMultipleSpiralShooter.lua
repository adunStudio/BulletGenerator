require("Script/Enemy")
require("Script/Bullet")

IntervalMultipleSpiralShooter = Enemy:New{}
IntervalMultipleSpiralShooter.name = "IntervalMultipleSpiralShooter"
IntervalMultipleSpiralShooter.shotAngle = 0
IntervalMultipleSpiralShooter.shotAngleRate = 0
IntervalMultipleSpiralShooter.shotSpeed = 0
IntervalMultipleSpiralShooter.shotCount = 0
IntervalMultipleSpiralShooter.interval = 0
IntervalMultipleSpiralShooter.time = 0

function IntervalMultipleSpiralShooter:Fire()

    if self.time == 0 then
        for i = 0, self.shotCount-1, 1 do
            local bullet = Bullet:New{x = self.x, y = self.y, angle = self.shotAngle + math.deg(i / self.shotCount), speed = self.shotSpeed}
            bullet:SetImage(self.bulletImage)

            table.insert(bullets, bullet)
          end

          self.shotAngle = self.shotAngle + self.shotAngleRate
    end

    self.time = (self.time + 1) % self.interval
end
