require("Script/Mover")

Ship = Mover:New()

function Ship:MoveUp()
  self.y = self.y - self.speed
end

function Ship:MoveDown()
  self.y = self.y + self.speed
end

function Ship:MoveLeft()
  self.x = self.x - self.speed
end

function Ship:MoveRight()
  self.x = self.x + self.speed
end
