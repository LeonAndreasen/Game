playerJohnny = {}
platform = {}
ball ={}
p = 1 --value for the sprite to be mirrored

Timer = 0
ScoreMultiplier = 1

love.load = function()
    print("Game is done loading")
    world = love.physics.newWorld(0,200,true)
    --Platform
    platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
    platform.x = 0
    platform.y =platform.height / 1.25

    --Player
    playerJohnny.x = love.graphics.getWidth() / 2
	playerJohnny.y = love.graphics.getHeight() / 2 

    Sprite = love.graphics.newImage('Johnny.png')
     playerJohnny.gravity = -600
     playerJohnny.speed = 125
     playerJohnny.ground = playerJohnny.y
     playerJohnny.y_velocity = 0
     playerJohnny.jump_height = -420
end

--spellogik
love.update = function (dt)
    world:update(dt)
    --walking mechanic
   if love.keyboard.isDown("d") then playerJohnny.x = playerJohnny.x + (playerJohnny.speed * dt)  end
   if love.keyboard.isDown("a") then playerJohnny.x = playerJohnny.x - (playerJohnny.speed * dt)
   end

--Running mechanic
if love.keyboard.isDown("d") and love.keyboard.isDown("lshift") then 
    playerJohnny.x= playerJohnny.x + (playerJohnny.speed * dt + 3)  end  
if love.keyboard.isDown("a") and love.keyboard.isDown("lshift") then 
    playerJohnny.x =playerJohnny.x - (playerJohnny.speed * dt + 3) end 


--mirroring the sprite 
function love.keypressed(key)
    if key == "a" then p = -1 elseif key == "d" then p = 1 end end

   --Jump mechanic
   if love.keyboard.isDown("space") then if playerJohnny.y_velocity == 0 then
        playerJohnny.y_velocity = playerJohnny.jump_height 
        end  end 
        
    --Jump physics
    if playerJohnny.y_velocity ~= 0 then                                     
        playerJohnny.y = playerJohnny.y + playerJohnny.y_velocity * dt                
        playerJohnny.y_velocity = playerJohnny.y_velocity - playerJohnny.gravity * dt
    end
    if playerJohnny.y > playerJohnny.ground then
        playerJohnny.y_velocity = 0
        playerJohnny.y = playerJohnny.ground
    end
    --Score counter
    Timer = Timer + dt
    if Timer > 3 then ScoreMultiplier = ScoreMultiplier + dt end
    end

 -- randomizes the spawns of the balls
Spawn = love.math.random(100)

--Draws the ground and Sprite

love.draw = function ()
    love.graphics.draw(Sprite,playerJohnny.x,playerJohnny.y,0,p,1,0,-54)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle('fill',platform.x,platform.y,platform.width,platform.height)
   --Collision objects
   if Spawn < 25 then 
    love.graphics.circle('fill',1400 / ScoreMultiplier, 450, 30, 100 )
   elseif Spawn < 50 and Spawn > 25 then
    love.graphics.circle('fill',1400 / ScoreMultiplier, 390, 30, 100 )
   elseif Spawn < 75 and Spawn > 50 then
    love.graphics.circle('fill',1400 / ScoreMultiplier, 320, 30, 100 )
   elseif Spawn > 75 and Spawn < 100 then
    love.graphics.circle('fill',1400 / ScoreMultiplier, 260, 30, 100 ) end
    --print out Score on the screen
    print(Spawn)
    love.graphics.printf("Score: "..math.floor(Timer)* 10,0, 1,620,"left",0,2,2)
    --
  if Timer < 1 then
    love.graphics.print("Press Spacebar to start! ",300,200, 0, 1.5,1.5) 
    love.graphics.print("controls:",200,20)
    love.graphics.print("A,D and Spacebar",200,35)
    love.graphics.print("lshift + key = Running",200,50)
end

end









