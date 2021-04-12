playerJohnny = {}
platform = {}
local balls ={
    x = 1600,
    y = 450,
    vx = 100,
    vy = 0,
}
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
for i = 1, 10, 1 do
    Spawn = love.math.random(4) 
    number = Spawn 
    print(Spawn) 
    
end
    

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
   
-- quits the Game
    if love.keyboard.isDown("q")
        then
       love.event.quit()
        end
    
--mirroring the sprite 
function love.keypressed(key)
    if key == "a" then p = -1 elseif key == "d" then p = 1 
    end
    -- reset key
    if key == "r" then
     Timer = 0
    end
    if key == "r" then 
        ScoreMultiplier = 1 + dt
        number = love.math.random(4)
    end
end

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
    if Timer > 1 then ScoreMultiplier = ScoreMultiplier + dt end
    
    

    balls.x = balls.x + (balls.vx * dt)
    balls.y = balls.y + (balls.vy * dt)

if balls.x > 0 then 
    balls.x = balls.x - (balls.vx * dt)
    end
end 

 





love.draw = function ()
    
    --Draws the ground and Sprite
    love.graphics.draw(Sprite,playerJohnny.x,playerJohnny.y,0,p,1,0,-54)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle('fill',platform.x,platform.y,platform.width,platform.height)

    if Timer > 4 then balls.x = 1600  end
        if Timer > 4 then ScoreMultiplier = ScoreMultiplier
        
    end



    if number == 1 then 
      ball1 =  love.graphics.circle('fill',balls.x - 300 * ScoreMultiplier, 450, 30, 100 )end
    
        if number == 2 then
      ball2 =  love.graphics.circle('fill',balls.x - 300 * ScoreMultiplier, 390, 30, 100 )end
        
        
        if number == 3 then
         ball3 =   love.graphics.circle('fill',balls.x -300 *  ScoreMultiplier, 320, 30, 100 )end
        
            if number == 4 then
             ball4 =   love.graphics.circle('fill',balls.x - 300 * ScoreMultiplier, 260, 30, 100 ) end
        
   --Collision objects
   
    

   
    
    --print out Score on the screen
    love.graphics.printf("Score: "..math.floor(Timer)* 10,0, 1,620,"left",0,2,2)

    --Instructions
  if Timer < 1 then
    love.graphics.print("Press Spacebar to start! ",300,200, 0, 1.5,1.5) 
    love.graphics.print("controls:",200,20)
    love.graphics.print("A,D and Spacebar         q to quit and r to restart",200,35)
    love.graphics.print("lshift + key = Running",200,50)
    
end
end









