require("player")
--Gives player.* and background*

require("monster")
--Gives monster.*

require("cloud")
--Gives cloud.*

ents = {}

--Hard coded enemies for now
table.insert(ents,monster)

--Decorations/Interactables in world
enviro = {}

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
	for _,v in ipairs(ents) do
		v.draw()
	end

	for _,v in ipairs(enviro) do
		v.draw()
	end

end

function love.update(dt)

	player.update()	
	for _,v in ipairs(ents) do
		v.update()
	end
	for _,v in ipairs(enviro) do
		v.update()
	end
end
