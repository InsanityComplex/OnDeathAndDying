-- Basic chaser creature

function generateMonster(xP,yP)
	local monster = {}
   monster.x = 100 --Spawn X-cord
  monster.y = 0 --Spawn Y-cord
	monster.speed = 5 --Speed per tick (x-cord)
	monster.width = 20/RATIO
	monster.height = 194/RATIO
  monster.currentImage = love.graphics.newImage("falling/00" .. string.format("%02d",i) .. ".png")
	--Collision
	monster.topCollision = false
	monster.bottomCollision = false
	monster.leftCollision = false
	monster.rightCollision = false
	monster.update = function()
		-- Chase if player is in sight radius
		-- player.x + backgroundX => map X position of player
		if math.abs(player.x + backgroundX - monster.x) < monster.visionRange  and monster.chasing == false then
			if(player.x + backgroundX > monster.x) then
				monster.x = monster.x + monster.speed
				monster.chasing = true
				monster.direction = 1
			elseif (player.x + backgroundX < monster.x) and monster.chasing == false then
				monster.x = monster.x - monster.speed
				monster.chasing = true
				monster.direction = -1
			end
		elseif(monster.chasing == true) then
			monster.x = monster.x + monster.speed * monster.direction
		end
	end
	monster.id = 1
	monster.image = love.graphics.newImage("eye.png")
	
	monster.draw = function()
    love.graphics.draw(monster.currentImage, monster.x + -1 * monster.flipImage * 50, monster.y, 0, (0.3/RATIO * monster.flipImage), 0.2/RATIO, 370, 70, 0, 0) 
	end

	return monster

end
