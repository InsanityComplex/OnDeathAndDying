ents = {}

require("player")
--Gives player.* and background*

require("platform")



--Decorations/Interactables in world

function love.load()
  player.load()
  gameState = 0
  platform = {}
  platform[0] = generatePlatform(250,530,300,20)
  platform[1] = generatePlatform(350,400,70,20)
end

function love.draw()

	if gameState == 666 then
		love.graphics.rectangle("fill", 0, 0, 800, 600)
		player.load()
		gameState = 0
	else
		player.draw()
    for i=0, table.getn(platform), 1 do
      platform[i].draw()
    end
	end

end

function checkCollision(ents)

	if player.y + player.height >= 600 then
		gameState = 666
	end

	--print(player.x .. " + " .. player.width .. " " .. platform.x .. " + " .. platform.width)
  for i=0, table.getn(platform), 1 do
    heightCheck = player.y--Used for duck vs. mobs
    if(player.isCrouching == true) then
      heightCheck = heightCheck + 90
    end
    if player.x + player.width > platform[i].x and player.x < platform[i].x + platform[i].width and player.y + player.height > platform[i].y and player.y < platform[i].y + platform[i].height then
      player.bottomCollision = true
    end
    
    if player.x + player.width > platform[i].x and player.x < platform[i].x then
    
      if platform[i].y <= heightCheck and heightCheck <= platform[i].y + platform[i].height then
       player.rightCollision = true
      elseif platform[i].y + platform[i].height < player.y + player.height and platform[i].y + platform[i].height > heightCheck then
        player.rightCollision = true
      end
    end
    if player.x + player.width > platform[i].x + platform[i].width and player.x < platform[i].x + platform[i].width then
    
      if platform[i].y <= heightCheck and heightCheck <= platform[i].y + platform[i].height then
       player.leftCollision = true
      elseif platform[i].y + platform[i].height < player.y + player.height and platform[i].y + platform[i].height > heightCheck then
        player.leftCollision = true
      end
    end
  end
end


--Check for player collision with ents, will destroy collided ents
function checkCollision2(ents)

	
	if player.x + player.width > ents[1].x and player.x < ents[1].x + ents[1].width and player.isCrouching == true then
		player.bottomCollision = true

	else for i,e in ipairs(ents) do

			--Check collisions and set player collision status
			--print(player.x .. " + " .. player.width .. " , " .. e.x .. " + " .. e.width )
			if player.x + player.width > e.x and player.x < e.x + e.width then

				--Bottom Collision
				if player.y < e.y and player.y + player.height > e.y then
					if e.id == 0 then
						player.bottomCollision = true
					elseif e.id == 1 then
						table.remove(ents,i)
					--Kill player or lose or something
					end

				--Top Collision
				elseif player.y < e.y + e.height  and player.y + player.height > e.y + e.height then
					if e.id == 0 then
						player.topCollision = true
					elseif e.id == 1 then
					table.remove(ents,i)
					--Kill player or lose or something
					end
				elseif(e.x < -100) then
					table.remove(ents,i)
				end
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

	checkCollision(ents)

	player.update()
end
