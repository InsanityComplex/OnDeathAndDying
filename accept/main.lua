CLONE_NUMS = 1

function loadLevel()

	ents = {}

	--Hard coded enemies for now
	ents[0] = generateSpike(-100,100) --0th element, why?!

	ents[1] = generateMonster(700,250)
	ents[2] = generateMonster(1000,250)
	ents[3] = generateMonster(1700,250)

end


function love.load()

	ents = {}

	require("player")
	--Gives player.* and background*

	player.load()
  
  --clone.load()

	require("monster")
	--Gives monster.*

	require("cloud")
	--Gives cloud.*

	require("spike")
	--Gives spike.*

	require("platform")

	gameState = 0

	platform = generatePlatform(250,530,300,20)


	--Hard coded enemies for now
	ents[0] = generateSpike(-100,100) --0th element, why?!

	ents[1] = generateMonster(700,250)
	ents[2] = generateMonster(1000,250)
	ents[3] = generateMonster(1700,250)

	--Decorations/Interactables in world
	--Eventually move image loads into here.
	backgroundImage = love.graphics.newImage("back.png")

end

function love.draw()

	if gameState == 666 then
		love.graphics.rectangle("fill", 0, 0, 800, 600)
		player.load()
		gameState = 0
	else
		--Background
		love.graphics.draw(backgroundImage, 0, 0, 0, 1, 1, backgroundX, backgroundY, 0, 0)
		if(backgroundX > 7200) then
			backgroundX = 7200
		end

		player.draw()

		platform.draw()

		--Ents
		for i=0,table.getn(ents),1 do
			ents[i].draw()
		end
	end

end

function checkCollision(ents)

	if player.y + player.height >= 600 then
		gameState = 666
	end

	--Check collision with platform
	heightCheck = player.y--Used for duck vs. mobs
	if(player.isCrouching == true) then
		heightCheck = heightCheck + 90
	end
	--print(player.x .. " + " .. player.width .. " " .. platform.x .. " + " .. platform.width)
	if player.x + player.width > platform.x and player.x < platform.x + platform.width and player.y+player.height > platform.y then
		player.bottomCollision = true
	--Mob Collision
	else 
		for i,e in ipairs(ents) do
			if player.x + player.width > e.x and player.x < e.x + e.width and heightCheck < e.y + e.height then
				if e.id == 1 then
					table.remove(ents,i)
					gameState = 666
					--Kill player or lose or something
				end
			end
		end

	end


end


--Check for player collision with ents, will destroy collided ents
function oldCheckCollision(ents)

	
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

	backgroundX = backgroundX + 1

	checkCollision(ents)

	player.update()

	for i=0,table.getn(ents),1 do
		ents[i].update()
	end
end
