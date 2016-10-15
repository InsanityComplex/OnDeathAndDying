
--Player--
player = {}
player.x = 50 --Spawn X-cord
player.y = 490 --Spawn Y-cord
player.speed = 5 --Speed per tick (x-cord)


--Jump logic
player.canJump = true -- Can the player jump?
player.jumpTicks = 30 --Ticks that each jump lasts
player.jumpTicksLeft = 0 --Ticks left until stop jump
player.jumpPerTick = 4 --Increase in Y per tick while jumping

player.gravityPerTick = -3 -- Decrease in Y when not colliding or jumping

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

--Environment Stuff
enviro = {}

cloud = {}
cloud.x = player.x
cloud.y = player.y - 180
cloud.status = 100
cloud.rain = {}

rain = {}
rain.x = cloud.x + 15
rain.y = cloud.y
rain.draw = function()
	love.graphics.setColor(0,0,180)
	love.graphics.circle("fill", rain.x, rain.y, 15)
end

table.insert(cloud.rain, rain)


cloud.update = function()
	cloud. x = player.x - 30
end

cloud.draw = function()
	love.graphics.draw(cloud.image, cloud.x, cloud.y, 0, 1, 1, 0, 0, 0, 0) 
end


function love.load()

--Player Animation, soon
--player.animation = love.graphics.newImage("test.png")

--Clouds, etc.
cloud.image = love.graphics.newImage("cloud.png")
table.insert(enviro,cloud)

end

function love.draw()

	--Background
	love.graphics.setColor(200,10,10)
	love.graphics.rectangle("fill",0,0,800,600)

	--Player
	love.graphics.setColor(125,0,60)
	--love.graphics.draw(player.animation, player.x, player.y, 0, 1, 1, 0, 0, 0, 0) 
	love.graphics.rectangle("fill", player.x, player.y, 50, 100)

	--Environment
	for _,v in ipairs(enviro) do
		v.draw()
	end

end

function love.update(dt)

	player.update()	
	for _,v in ipairs(enviro) do
		v.update()
	end
end
