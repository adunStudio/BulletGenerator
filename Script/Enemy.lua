require("Script/Mover")

Enemy = Mover:New{}
Enemy.bulletImage = nil;

function Enemy:SetBulletImage(img)
  self.bulletImage = img
end

function Enemy:Fire()

end
