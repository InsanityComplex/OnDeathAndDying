require("player")


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
backgroundImage = love.graphics.newImage("back2.jpg")
cloud.image = love.graphics.newImage("cloud.png")
table.insert(enviro,cloud)

end

function love.draw()

	--Background
	love.graphics.draw(backgroundImage, 0, 0, 0, 1, 1, backgroundX, backgroundY, 0, 0)

	--Player
	--love.graphics.setColor(125,0,60)
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
