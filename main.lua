
--Player--
player = {}
player.x = 50 --Spawn X-cord
player.y = 490 --Spawn Y-cord
player.speed = 5

player.move = function()

	if love.keyboard.isDown("left") then
		player.x = player.x - speed
	end

	if love.keyboard.isDown("right") then
		player.x = player.x + speed
	end

end

--Player Animation, soon
player.animation = love.graphics.newImage("test.png")

function love.load()

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

	--Player Movement--
	player.move()	

end
