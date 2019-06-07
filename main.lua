require("Script/Ship")
require("Script/Enemy")
require("Script/Bullet")
require("Script/Shooter/01_DirectionalShooter")
require("Script/Shooter/02_SpiralShooter")
require("Script/Shooter/03_MultipleSpiralShooter")
require("Script/Shooter/04_IntervalMultipleSpiralShooter")
require("Script/Shooter/05_BiDirectionalSpiralShooter")
require("Script/Shooter/06_BentSpiralShooter")
require("Script/Shooter/12_NWayShooter")
require("Script/Shooter/13_CircleShooter")
require("Script/Shooter/14_AimingNWayShooter")
require("Script/Shooter/15_IntermittentAimingNWayShooter")
require("Script/Shooter/16_RandomNWayShooter")

IMAGE = {}

player = nil

enemys = {}
enemy = nil
enemyIndex = 0

bullets = {}

FPS = 1 / 30
nextTime = 0

clientWidth = 0
clientHeight = 0
clientOffset = 100

function love.load()
    nextTime = love.timer.getTime()


    clientWidth, clientHeight = love.graphics.getDimensions()

    IMAGE["ship"] = love.graphics.newImage("/Image/ship.png")
    IMAGE["enemy"] = love.graphics.newImage("/Image/enemy.png")
    IMAGE["bullet"] = love.graphics.newImage("/Image/bullet.png")

    player = Ship:New{width = 48, height = 48, speed = 10}
    player:SetImage(IMAGE["ship"])
    player:SetPosition(100, 500)

    enemys[1] = DirectionalShooter:New{shotAngle = 90, shotSpeed = 25}
    enemys[2] = SpiralShooter:New{shotAngle = 90, shotAngleRate = 10, shotSpeed = 10}
    enemys[3] = MultipleSpiralShooter:New{shotAngle = 90, shotAngleRate = 10, shotSpeed = 10, shotCount = 4}
    enemys[4] = IntervalMultipleSpiralShooter:New{shotAngle = 1.14, shotAngleRate = 10.57, shotSpeed = 20, shotCount = 4, interval = 6}
    enemys[5] = BiDirectionalSpiralShooter:New{shotAngle = {90, 90}, shotAngleRate = {5, - 5}, shotSpeed = 20, shotCount = 4, interval = 6}
    enemys[6] = BentSpiralShooter:New{shotAngle = 0, shotAngleRate = 1.14, shotSpeed = 10, shotCount = 10, interval = 6, bulletAngleRate = 0, bulletSpeedRate = 0}
    enemys[7] = NWayShooter:New{shotAngle = 0, shotAngleRange = 90, shotSpeed = 10, shotCount = 6, interval = 15, bulletAngleRate = 0, bulletSpeedRate = 0}
    enemys[8] = CircleShooter:New{shotSpeed = 10, shotCount = 36, interval = 15, bulletAngleRate = 0, bulletSpeedRate = 0}
    enemys[9] = AimingNWayShooter:New{shotAngleRange = 90, shotSpeed = 10, shotCount = 11, interval = 25, bulletAngleRate = 0, bulletSpeedRate = 0}
    enemys[10] = IntermittentAimingNWayShooter:New{shotAngleRange = 90, shotSpeed = 10, shotCount = 11, interval = 4, shotTime = 10, waitTime = 20}
    enemys[11] = RandomNWayShooter:New{shotAngle = 90, shotAngleRange = 45, shotSpeed = 15, shotCount = 6, interval = 7}

    enemyIndex = #enemys
    enemy = enemys[enemyIndex]

    enemy:SetImage(IMAGE["enemy"])
    enemy:SetBulletImage(IMAGE["bullet"])
    enemy:SetPosition(clientWidth / 2, 100)

end

function InputProcess()
    if love.keyboard.isDown("up", "w") then
        player:MoveUp()
    end

    if love.keyboard.isDown("down", "s") then
        player:MoveDown()
    end

    if love.keyboard.isDown("left", "a") then
        player:MoveLeft()
    end

    if love.keyboard.isDown("right", "d") then
        player:MoveRight()
    end
end

function love.update(dt)
    nextTime = nextTime + FPS

    InputProcess()

    if enemy ~= nil then
        enemy:Fire(player.x, player.y)
    end

    for i = 1, #bullets, 1 do
        local b = bullets[i]

        if b ~= nil then
            b:Move()

            local x, y = bullets[i]:GetCenterPosition()

            if x <= 0 - clientOffset or x >= clientWidth + clientOffset or y <= 0 - clientOffset or y >= clientHeight + clientOffset then
                b.alive = false
                bullets[i] = nil
                table.remove(bullets, i)
            end
        end
    end

    if bullet ~= nil then
        bullet:Move()
    end

end


function love.draw()

    if player ~= nil then
        player:Draw()
    end

    if enemy ~= nil then
        enemy:Draw()
    end

    for i = 1, #bullets, 1 do
        if bullets[i] ~= nil then
            bullets[i]:Draw()
        end
    end

    love.graphics.print("Current FPS: " .. tostring(love.timer.getFPS( )), 10, 10)
    love.graphics.print("Current Enemy: ".. tostring(enemyIndex) .. " / " .. tostring(#enemys), 10, 25)
    love.graphics.print("Current Bullet Count: " .. tostring(#bullets), 10, 40)

    love.graphics.print("[" .. enemy.name .. "] ", 10, 65)


    local curTime = love.timer.getTime()
    if nextTime <= curTime then
        nextTime = curTime
        return
    end
    love.timer.sleep(nextTime - curTime)
end

function love.keypressed(key, unicode)
    if key == 'r' then
        enemyIndex = enemyIndex + 1
        if enemyIndex > #enemys then
            enemyIndex = 1
        end

        enemy = enemys[enemyIndex]

        enemy:SetImage(IMAGE["enemy"])
        enemy:SetBulletImage(IMAGE["bullet"])
        enemy:SetPosition(clientWidth / 2, 100)
    end
end
