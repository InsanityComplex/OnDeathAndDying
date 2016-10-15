-- Basic chaser creature

function generateMonster(xP,yP)
	local monster = {}
	monster.x = xP
	monster.y = yP
	monster.width = 100
	monster.height = 100
	monster.speed = 3
	monster.visionRange = 250
	monster.chasing = false
	monster.direction = 0

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
		love.graphics.draw(monster.image, monster.x, monster.y, 0, 0.1, 0.1, 0, 0, 0, 0) 
	end

	return monster

end
