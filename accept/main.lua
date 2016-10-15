ents = {}

require("player")
--Gives player.* and background*

require("monster")
--Gives monster.*

require("cloud")
--Gives cloud.*

require("spike")
--Gives spike.*

--Hard coded enemies for now
ents[0] = monster --First element is not deleting, will replace with a placeholder later
ents[1] = generateSpike(600,100)
ents[2] = generateSpike(300,100)

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
	player.draw()

	--Environment
	for i=0,table.getn(ents),1 do
		ents[i].draw()
	end

	for _,v in ipairs(enviro) do
		v.draw()
	end

end

--Check for player collision with ents, will destroy collided ents
function checkCollision(ents)

	for i,e in ipairs(ents) do
		if player.x + player.width > e.x and player.x < e.x + e.width then
			table.remove(ents,i)
			--Kill player or lose or something
		end
	end 

end

function love.update(dt)

	player.update()

	checkCollision(ents)

	for i=0,table.getn(ents),1 do
		ents[i].update()
	end
	for _,v in ipairs(enviro) do
		v.update()
	end
end
