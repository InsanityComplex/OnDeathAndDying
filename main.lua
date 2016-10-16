function loadLevel()

	ents = {}

	--Hard coded enemies for now
	--ents[0] = generateSpike(-100,100) --0th element, why?!
  createMonsters()
end


function love.load()

	ents = {}

	require("player")
	--Gives player.* and background*

	require("audio")
  audioLoad()
	audioPlayTitle()

	player.load()

	require("monster")
	--Gives monster.*

	require("cloud")
	--Gives cloud.*

	require("spike")
	--Gives spike.*

	require("platform")

	gameState = 0

	platform = generatePlatform(0,575,800,20)
  
  DEATH_PIT = 820

  backgroundInc = 30  

  tempColor = 0

	--Hard coded enemies for now

	createMonsters()

	--Decorations/Interactables in world
	--Eventually move image loads into here.
	backgroundImage = love.graphics.newImage("back.png")

end

function love.draw()

	if gameState == 666 then
		initWorld()
		gameState = 0
	else
		--Background
		love.graphics.draw(backgroundImage, 0, 0, 0, 1, 1, backgroundX, backgroundY, 0, 0)


		player.draw()
		platform.draw()

		--Ents
		for i=1,table.getn(ents),1 do
			ents[i].draw()
		end
    
    function initWorld()
      love.graphics.rectangle("fill", 0, 0, 800, 600)
      player.load()
      createMonsters()
      for i=1,table.getn(ents),1 do
        ents[i].draw()
      end
      if backgroundInc < 0 then 
        backgroundInc = -backgroundInc
      end
    end
	end

end

function checkCollision(ents)

	if player.y + player.height >= DEATH_PIT then
		gameState = 666
	end

	--Check collision with platform
  heightCheck = player.y--Used for duck vs. mobs
    if(player.isCrouching == true) then
      heightCheck = heightCheck + 90
    end
    if not player.isFalling and player.x + player.width > platform.x and player.x < platform.x + platform.width and player.y + player.height > platform.y and player.y < platform.y + platform.height then
      player.bottomCollision = true
    elseif player.isFalling and player.x + player.width > platform.x and player.x < platform.x + platform.width and player.y + player.height - FALLING_BOUNCE > platform.y and player.y < platform.y + platform.height then
    player.bottomCollision = true
    end
    
    
    if player.x + player.width > platform.x and player.x < platform.x then
    
      if platform.y <= heightCheck and heightCheck <= platform.y + platform.height then
       player.rightCollision = true
      elseif platform.y + platform.height < player.y + player.height and platform.y + platform.height > heightCheck then
        player.rightCollision = true
      end
    end
    if player.x + player.width > platform.x + platform.width and player.x < platform.x + platform.width then
    
      if platform.y <= heightCheck and heightCheck <= platform.y + platform.height then
       player.leftCollision = true
      elseif platform.y + platform.height < player.y + player.height and platform.y + platform.height > heightCheck then
        player.leftCollision = true
      end
    --ent collision
	else 
		for i,e in ipairs(ents) do
			if player.x + player.width > e.x and player.x < e.x + e.width and heightCheck < e.y + e.height and player.y + player.height > e.y then
				if e.id == 1 then
					table.remove(ents,i)
					gameState = 666
					--Kill player or lose or something
				end
      elseif e.x < -100 then
          table.remove(ents,i)
          table.insert(ents,generateMonster())
			end
		end



end




end

function love.update(dt)

	--Reset player collision
	player.topCollision = false
	player.bottomCollision = false
	player.leftCollision = false
	player.rightCollision = false

	backgroundX = backgroundX + backgroundInc

	checkCollision(ents)

	player.update()

	for i=1,table.getn(ents),1 do
		ents[i].update()
	end
  
  
  
  if(backgroundX > 7200 - 50) then
		backgroundX = 7200 - 50
    backgroundInc = - backgroundInc
    changeColor()
  elseif(backgroundX <= 20) then
    backgroundInc = - backgroundInc
    changeColor()
  end
end


function changeColor()
  love.graphics.setColor(math.random(70,255), math.random(70,255), math.random(70,255))
end


function createMonsters() 
  for i = 1, 6, 1 do
    ents[i] = generateMonster()
  end
end
    