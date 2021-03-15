playerJohnny = {}
platform = {}
x= 0
y= 0
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
end

--spellogik
love.update = function (dt)
   -- r = r + 10 *dt

if love.keyboard.isDown("d") and love.keyboard.isDown("lshift") then 
    playerJohnny.x= x + 10 end if love.keyboard.isDown("s") and love.keyboard.isDown("lshift")then playerJohnny.y= y + 10 end 
    if love.keyboard.isDown("a") and love.keyboard.isDown("lshift") then playerJohnny.x = x -10 end 
    if love.keyboard.isDown("space") and love.keyboard.isDown("lshift")then playerJohnny.y= y -10 end --behöver ta reda på hur jag kan få karaktären att springa när jag håller ner lshift + knapp
end
love.keypressed = function(pressed_key)
    if love.keyboard.isDown("d") then x = x + 10
    elseif pressed_key == "s" then   y = y + 10
    elseif pressed_key == "a" then x = x -10
    elseif pressed_key == "space" then y = y -10 
    end
    end

--ritar ut

love.draw = function ()
    love.graphics.draw(Sprite,playerJohnny.x,playerJohnny.y,0,1,1,0,-20)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle('fill',platform.x,platform.y,platform.width,platform.height)
end




--    love.graphics.setColor(current_color)
--love.graphics.polygon("fill", circle)

