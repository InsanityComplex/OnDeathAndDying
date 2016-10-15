ents = {}

require("player")
--Gives player.* and background*

require("monster")
--Gives monster.*

require("cloud")
--Gives cloud.*

require("spike")
--Gives spike.*

require("platform")

--Hard coded enemies for now
ents[0] = generateSpike(-100,100) --0th element, why?!

ents[1] = generatePlatform(250,530,300,20)

ents[2] = generateMonster(700,250)
ents[3] = generateMonster(1000,250)
ents[4] = generateMonster(1700,250)


--Decorations/Interactables in world

function love.load()

--Eventually move image loads into here.
backgroundImage = love.graphics.newImage("back2.jpg")

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

end

--Check for player collision with ents, will destroy collided ents
function checkCollision(ents)

	player.topCollision = false
	player.bottomCollision = false
	player.leftCollision = false
	player.rightCollision = false

	for i,e in ipairs(ents) do

		--Check collisions and set player collision status
		--print(player.x .. " + " .. player.width .. " , " .. e.x .. " + " .. e.width )
		if player.x + player.width > e.x and player.x < e.x + e.width then

			--Bottom Collision
			if player.y < e.y and player.y + player.height > e.y then
				if e.id == 0 then
					player.bottomCollision = true
				elseif e.id == 1 then
					table.remove(ents,i)
				--Kill player or lose or something
				end

			--Top Collision
			elseif player.y < e.y + e.height  and player.y + player.height > e.y + e.height then
				if e.id == 0 then
					player.topCollision = true
				elseif e.id == 1 then
				table.remove(ents,i)
				--Kill player or lose or something
				end
			elseif(e.x < -100) then
				table.remove(ents,i)
			end
		end
	end 

end

function love.update(dt)

	checkCollision(ents)

	player.update()

	for i=0,table.getn(ents),1 do
		ents[i].update()
	end
end
