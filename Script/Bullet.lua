require("Script/Mover")
require("Script/Function")

Bullet = Mover:New{}
Bullet.angleRate = 0
Bullet.speedRate = 0
Bullet.width = 16
Bullet.height = 16

function Bullet:Move()
    radian = math.rad(self.angle)

    self.x = self.x + self.speed * math.cos(radian);
    self.y = self.y + self.speed * math.sin(radian);

    self.angle = self.angle + self.angleRate

    self.speed = self.speed + self.speedRate
end

function ShootNWay(x, y, angle, angleRange, speed, count, angleRate, speedRate)
    if count > 1 then
        for i = 0, count-1, 1 do
            local newAngle = angle + angleRange * (i / (count-1) - 0.5)
            local bullet = Bullet:New{x = x, y = y, angle = newAngle, angleRate = angleRate, speed = speed, speedRate = speedRate}
            bullet:SetImage(IMAGE["bullet"])
            table.insert(bullets, bullet)
        end
    else
        if count == 1 then
            local bullet = Bullet:New{x = x, y = y, angle = angle, angleRate = angleRate, speed = speed, speedRate = speedRate}
            bullet:SetImage(IMAGE["bullet"])
            table.insert(bullets, bullet)
        end

    end
end
