playground = require('scene.playground')

menu = {}

function menu:draw()
  love.graphics.print("Press Enter to continue", 10, 10)
end

function menu.init()
  love.graphics.print("Initializing...", 30, 30)
end

function menu:keyreleased(key, code)
  love.graphics.print("Enter pressed", 50, 50)
  if key == 'enter' then
  	Gamestate.switch(playground)
  end
end

return menu