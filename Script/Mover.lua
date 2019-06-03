require("Script/Function")

Mover =
{
  img = nil,
  x = 0,
  y = 0,
  angle = 0,
  rotation = 0,
  scaleX = 1,
  scaleY = 1,
  alpha = 1,
  alive = 1,
  width = 64,
  height = 64,
  name = ""
}

function Mover:New(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    return o
end

function Mover:SetImage(img)
    self.img = img
    self.scaleX, self.scaleY = GetImageScaleForNewDimensions(img, self.width, self.height)
end

function Mover:Move()

end

function Mover:Draw()
    if self.img == nil or self.alive == false then
        return
    end

    local x = self.x - self.width / 2
    local y = self.y - self.height / 2

    love.graphics.draw(self.img, x, y, self.rotation, self.scaleX, self.scaleY)
end

function Mover:SetPosition(x, y)
    self.x = x
    self.y = y
end

function Mover:GetCenterPosition()
    return self.x + (self.width / 2), self.y + (self.height / 2)
end
