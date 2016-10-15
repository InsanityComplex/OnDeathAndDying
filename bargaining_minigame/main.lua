player = {}
player.x = 50
player.y = 490 --Spawn Y-cord
player.speed = 5
player.contactBottom = 0
player.currentJumpV = 0
player.jumpHeight = 24 -- How high do we jump?
player.gravityPerTick = -4
player.height = 100
player.width = 50

player.update = function()

	--No platform collision atm
	if player.currentJumpV > 0 then
		player.currentJumpV = player.currentJumpV - 2
	end
	if player.y + player.height < 600 then
		player.y = player.y - player.gravityPerTick - player.currentJumpV
  else --temporary for testing
    player.contactBottom = 1
	end
	player.move()
end

player.move = function()

	if love.keyboard.isDown("left")  then
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

	if player.contactBottom == 1 then
		player.y = player.y - player.jumpHeight
		player.currentJumpV = player.jumpHeight
    player.contactBottom = 0 --temporary for testing
	end	

end

function love.load()

--Player Animation, soon
player.animation = love.graphics.newImage("test.png")

end

function love.draw()

	--Background
	love.graphics.setColor(100,100,100)
	love.graphics.rectangle("fill",0,0,800,600)

	--Player
	love.graphics.setColor(125,0,60)
	love.graphics.draw(player.animation, player.x, player.y, 0, 1, 1, 0, 0, 0, 0) 
end

function love.update(dt)

	player.update()	

end
