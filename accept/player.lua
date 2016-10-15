--Player--
player = {}
player.x = 50 --Spawn X-cord
player.y = 490 --Spawn Y-cord
player.speed = 5 --Speed per tick (x-cord)


--Jump logic
player.canJump = true -- Can the player jump?
player.jumpTicks = 30 --Ticks that each jump lasts
player.jumpTicksLeft = 0 --Ticks left until stop jump
player.jumpPerTick = 7 --Increase in Y per tick while jumping

player.gravityPerTick = -4 -- Decrease in Y when not colliding or jumping

player.update = function()

	--Jump Logic
	if player.jumpTicksLeft > 0 then
		player.y = player.y - player.jumpPerTick
		player.jumpTicksLeft = player.jumpTicksLeft - 1
	elseif player.canJump and love.keyboard.isDown("up") then
		player.canJump = false
		player.jumpTicksLeft = player.jumpTicks
	elseif player.y + 50 < 550 then
		player.y = player.y - player.gravityPerTick
	else
		player.canJump = true
	end
	player.move()
end

player.move = function()

	if love.keyboard.isDown("left") then
		if(player.x < 100) then
			if backgroundX > -1 then
			backgroundX = backgroundX - player.speed
			end
		else
			player.x = player.x - player.speed
		end
	end

	if love.keyboard.isDown("right") then
		if(player.x > 700) then
			if backgroundX < 1000 then
			backgroundX = backgroundX + player.speed
			end
		else
			player.x = player.x + player.speed
		end
	end
	print(backgroundX)

	if love.keyboard.isDown("up") then
		player.jump()
	end

end

player.jump = function()

	if player.currentJumpCD == 0 then
		player.y = player.y - player.jumpHeight
		player.currentJumpCD = player.jumpCD
	end	
end

--Environment Stuff
backgroundX = 0
backgroundY = 0