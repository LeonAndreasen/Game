local r = 50
local current_color = {1,1,1,1}
--callback funktioner (spelmotorn som hämtar funktionerna istället för vi)

love.load = function()
    print("Game is done loading")
    x = 0 

end

--spellogik
love.update = function (dt)
    r = r + 10 *dt
    x = x + 1
end
love.keypressed = function(pressed_key)
    if pressed_key == "d" then
        love.draw = function ()
            love.graphics.circle("fill",x,230,100) if pressed_key == "a" then 
                love.draw = function ()     
                end end end end end
--ritar ut






--    love.graphics.setColor(current_color)
--love.graphics.polygon("fill", circle)

