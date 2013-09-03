Gamestate = require "lib.hump.gamestate"
play      = require "scene.playground"

function love.load()
  love.graphics.setCaption('Gab The Game')
  Gamestate.registerEvents()
  Gamestate.switch(play)
end
