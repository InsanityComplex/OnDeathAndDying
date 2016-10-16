--Load images, move to load function soon
animation = {}
animation.player = {}
function animation.player.load()
  player.falling = {}
  for i=1,40 do
    player.falling[i-1] = love.graphics.newImage("Sprites/Player/Falling/" .. string.format("%04d",i) .. ".png")
  end


  player.running = {}
  for i=1,28 do
    player.running[i-1] = love.graphics.newImage("Sprites/Player/running/" .. string.format("%04d",i) .. ".png")
  end

  player.idle = {}
  for i=1,60 do
    player.idle[i-1] = love.graphics.newImage("Sprites/Player/idle/" .. string.format("%04d",i) .. ".png")
  end

  player.crouch = {}
  for i=1,10 do
    player.crouch[i-1] = love.graphics.newImage("Sprites/Player/Crouch/" .. string.format("%04d",i) .. ".png")
  end

  player.jumpA = {}
  player.jumpA[0] = love.graphics.newImage("Sprites/Player/jump/001.png")
  
  player.crawl = {}
  for i=1, 24 do
    player.crawl[i - 1] = love.graphics.newImage("Sprites/Player/crawl/" .. string.format("%04d",i) .. ".png")
  end
end

animation.monster = {}
function animation.monster.load()
  monsterfalling = {}
  for i=1,40 do
    monsterfalling[i-1] = love.graphics.newImage("Sprites/Player/Falling/" .. string.format("%04d",i) .. ".png")
  end
end