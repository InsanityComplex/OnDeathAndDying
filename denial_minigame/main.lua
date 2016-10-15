
--Player--
player = {}
player.x = 50 --Spawn X-cord
player.y = 490 --Spawn Y-cord
player.speed = 5
player.jumpCD = 240 -- Default cooldown to jump again
player.currentJumpCD = 0 -- Current ticks left till canjump
player.jumpHeight = 70 -- How high do we jump?
player.gravityPerTick = -1

player.update = function()

	--No platform collision atm
	if player.currentJumpCD > 0 then
		player.currentJumpCD = player.currentJumpCD - 1
	end
	if player.y + 50 < 600 then
		player.y = player.y - player.gravityPerTick
	end
	player.move()
end

player.move = function()

	if love.keyboard.isDown("left") then
		player.x = player.x - player.speed
	end

	if love.keyboard.isDown("right") then
		player.x = player.x + player.speed
	end

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

function love.load()

--Player Animation, soon
player.animation = love.graphics.newImage("Player_Sprite/idle/0001.png")

end

function love.draw()

	--Background
	love.graphics.setColor(200,10,10)
	love.graphics.rectangle("fill",0,0,800,600)

	--Player
	love.graphics.setColor(125,0,60)
	love.graphics.draw(player.animation, player.x, player.y, 0, 1, 1, 0, 0, 0, 0) 
end

function love.update(dt)

	player.update()	

end
