-- Basic chaser creature
monsterfalling = {}
for i=1,40 do
	monsterfalling[i-1] = love.graphics.newImage("Sprites/Player/Falling/" .. string.format("%04d",i) .. ".png")
end

function generateMonster(xP,yP)
	local monster = {}
	monster.x = xP + math.random(-20, 20)
	monster.y = yP + math.random(-20, 20)
	monster.width = 100
	monster.height = 100
	monster.speed = 3
	monster.visionRange = 250
	monster.chasing = false
	monster.direction = 0
  monster.currentImage = 0
  monster.currentTick = 0
  monster.currentAngle = math.random(360)

	monster.update = function()
		-- Chase if player is in sight radius
		-- player.x + backgroundX => map X position of player  
			monster.x = monster.x - monster.speed
	monster.id = 1
  monster.currentTick = monster.currentTick + 1
	if monster.currentTick >= 39 then
			monster.currentTick = 0
  end
  end

  monster.draw = function()
		love.graphics.draw(monsterfalling[monster.currentTick], monster.x, monster.y, monster.currentAngle, 0.1, -0.1, 0, 0, 0, 0) 
	end

	return monster

end
