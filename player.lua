--Player--
player = {}

player.load = function()
	player.x = 250 --Spawn X-cord
	player.y = 290 --Spawn Y-cord
	player.speed = 5 --Speed per tick (x-cord)
	player.width = 20
	player.height = 194

	--Collision
	player.topCollision = false
	player.bottomCollision = false
	player.leftCollision = false
	player.rightCollision = false

	--Jump logic
	player.canJump = true -- Can the player jump?
	player.jumpTicks = 20 --Ticks that each jump lasts
	player.jumpTicksLeft = 0 --Ticks left until stop jump
	player.jumpPerTick = 14--Increase in Y per tick while jumping

	player.isCrouching = false
	player.isFalling = false

	player.gravityPerTick = -13 -- Decrease in Y when not colliding or jumping

	player.currentTick = 0
	player.flipImage = 1

	player.currentImage = ''

  FALLING_BOUNCE = player.width

	--Environment Stuff
	backgroundX = 0	
	backgroundY = 0

end

--Load images, move to load function soon
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


--Draw the player
player.draw = function()	

	love.graphics.draw(player.currentImage, player.x + -1 * player.flipImage * 50, player.y, 0, (0.3 * player.flipImage), 0.2, 370, 70, 0, 0) 
	---1 * flipImage * 50 is to keep sprite from jumping around when player changes direction
end

player.update = function()
	
	--Jump Logic
	if player.jumpTicksLeft > 0 then
		player.y = player.y - player.jumpPerTick
		player.jumpTicksLeft = player.jumpTicksLeft - 1
	elseif player.canJump and love.keyboard.isDown("up") then
		player.canJump = false
		player.jumpTicksLeft = player.jumpTicks
	elseif player.y + player.height < DEATH_PIT and not player.bottomCollision then
		player.y = player.y - player.gravityPerTick
		player.isFalling = true
	else
    if player.isFalling then
      player.y = player.y - FALLING_BOUNCE
    end
		player.canJump = true
		player.isFalling = false
	end
	player.move()
end

player.move = function()

	--There is a lot here, I need to and will clean this up later, preferably after some sleep
	if love.keyboard.isDown("down") then
		if(player.isCrouching == false) then
			player.currentTick = 0
			
		end
		player.isCrouching = true
		if(player.currentTick < 9) then
			player.currentTick = player.currentTick + 1
		elseif (player.currentTick > 9) then
			player.currentTick = 0
		end
		player.currentImage = player.crouch[player.currentTick]
	else
		player.isCrouching = false
	end

	moving = false
	jumping = false
	if love.keyboard.isDown("left") then
		player.flipImage = -1
		moving = true
		if player.leftCollision == false then
			if(player.x < 150) then
				if backgroundX > -1 then
				--backgroundX = backgroundX - player.speed
				end
			else
				player.x = player.x - player.speed
			end
		end
	end

	if love.keyboard.isDown("right") then
		player.flipImage = 1
		moving = true
		if player.rightCollision == false then
			if(player.x > 650) then
				if backgroundX < 1000 then
				--backgroundX = backgroundX + player.speed
				end
			else
				player.x = player.x + player.speed
			end
		end
	end

	if love.keyboard.isDown("up") then
		jumping = true
		player.jump()
	end

	--Set animation
	if jumping or player.jumpTicksLeft > 0 then
		player.currentImage = player.jumpA[0]
	elseif moving then
		if(player.currentTick >= 24) then 
			player.currentTick = 0
		end
		if not player.isCrouching then
			player.currentTick = player.currentTick + 1
			player.currentImage = player.running[player.currentTick]
		end
	elseif player.isCrouching == false then
		if (player.currentTick >= 59) then
			player.currentTick = 0
		end
		player.currentTick = player.currentTick + 1
		player.currentImage = player.idle[player.currentTick]
	end

	if player.isFalling == true then
		if player.currentTick >= 39 then
			player.currentTick = 0
		end
		player.currentImage = player.falling[player.currentTick]
	end

end

player.jump = function()

	if player.currentJumpCD == 0 then
		player.currentJumpCD = player.jumpCD
	end	
end