ents = {}

require("player")

function love.load()
  
  
  WINDOW_HEIGHT = 500
  WINDOW_WIDTH = 750
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
  love.graphics.setBackgroundColor(154, 20, 23)
  love.graphics.setColor(0, 0, 0)
end

function love.update(dt)
 if love.keyboard.isDown("right")
 then player.x-player.speed
end

function love.draw()
  love.graphics.setColor(30, 30, 30)

  love.graphics.Image()
    love.graphics.retangle(WINDOW_HIGHT / 2 - 15, WINDOW_HEIGHT / 2 - 15, 15, 30)
  end