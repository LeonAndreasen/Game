playerJohnny = {}
platform = {}
p = 1
--callback funktioner (spelmotorn som hämtar funktionerna istället för vi)

love.load = function()
    print("Game is done loading")
    World = love.physics.newWorld(1,2)
    platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
    platform.x = 0
    platform.y =platform.height / 1.25

    playerJohnny.x = love.graphics.getWidth() / 2
	playerJohnny.y = love.graphics.getHeight() / 2

    playerJohnny.gravity = -300

    Sprite = love.graphics.newImage('Johnny.png')

     playerJohnny.speed = 150
     playerJohnny.ground = playerJohnny.y
     playerJohnny.y_velocity = 0
     playerJohnny.jump_height = -250
end

--spellogik
love.update = function (dt)
    --walking mechanic
   if love.keyboard.isDown("d") then playerJohnny.x = playerJohnny.x + (playerJohnny.speed * dt)  end
   if love.keyboard.isDown("a") then playerJohnny.x = playerJohnny.x - (playerJohnny.speed * dt)
   end
end
function love.keypressed(key)
    if key == "a" then p = -1 elseif key == "d" then p = 1
end
   --Jump mechanic
   if love.keyboard.isDown("space") then if playerJohnny.y_velocity== 0 then
        playerJohnny.y_velocity = playerJohnny.jump_height end end
    --Jump physics

   --Running mechanic
    if love.keyboard.isDown("d") and love.keyboard.isDown("lshift") then 
        playerJohnny.x= playerJohnny.x + (playerJohnny.speed * dt +4)  end  
    if love.keyboard.isDown("a") and love.keyboard.isDown("lshift") then 
        playerJohnny.x =playerJohnny.x - (playerJohnny.speed * dt + 4) end 
end

--Draws the ground and Sprite

love.draw = function ()
    love.graphics.draw(Sprite,playerJohnny.x,playerJohnny.y,0,p,1,0,-50)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle('fill',platform.x,platform.y,platform.width,platform.height)
end






