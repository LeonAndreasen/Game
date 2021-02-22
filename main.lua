local r = 50
local current_color = {1,1,1,1}
--callback funktioner (spelmotorn som hämtar funktionerna istället för vi)

love.load = function()
    print("Game is done loading")
    x = 0 
y= 0
end

--spellogik
love.update = function (dt)
   -- r = r + 10 *dt

end
love.keypressed = function(pressed_key)
    if pressed_key == "d" then
        x = x + 10
 elseif pressed_key == "s" then 
                y = y + 10
 end
 if pressed_key == "a" then x = x -10
 end
 if pressed_key == "w" then y = y -10 
end
end

--ritar ut

love.draw = function ()
    love.graphics.circle("fill",x,y,100)
end




--    love.graphics.setColor(current_color)
--love.graphics.polygon("fill", circle)

