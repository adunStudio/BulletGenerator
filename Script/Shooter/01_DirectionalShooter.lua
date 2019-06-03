require("Script/Enemy")
require("Script/Bullet")

DirectionalShooter = Enemy:New{}
DirectionalShooter.name = "DirectionalShooter"
DirectionalShooter.shotAngle = 0
DirectionalShooter.shotSpeed = 0;

function DirectionalShooter:Fire()
    local bullet = Bullet:New{x = self.x, y = self.y, angle = self.shotAngle, speed = self.shotSpeed}
    bullet:SetImage(self.bulletImage)

    table.insert(bullets, bullet)
end
