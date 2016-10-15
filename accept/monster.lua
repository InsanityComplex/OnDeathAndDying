-- Basic chaser creature

monster = {}
monster.height = 50
monster.width = 50
monster.x = 1000
monster.y = 600 - monster.height

monster.speed = 3
monster.visionRange = 250

monster.draw = function()
	love.graphics.rectangle("fill",monster.x-backgroundX, monster.y, monster.width, monster.height)
	print("Draw")
end

monster.update = function()
	-- Chase if player is in sight radius
	-- player.x + backgroundX => map X position of player
	if math.abs(player.x + backgroundX - monster.x) < monster.visionRange then
		if(player.x + backgroundX > monster.x) then
			monster.x = monster.x + monster.speed
		elseif (player.x + backgroundX < monster.x) then
			monster.x = monster.x - monster.speed
		end
	end
end
